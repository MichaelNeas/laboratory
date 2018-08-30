import json
from pprint import pprint
from pprint import pformat
import logging 
import copy 

logging.basicConfig(format="%(asctime)s - %(name)s - [ %(levelname)s ] - [ %(filename)s:%(funcName)s():%(lineno)s ] - %(message)s", level=logging.DEBUG)
logger = logging.getLogger(__name__)

def print_json(object):
    item = json.dumps(object, indent=4, sort_keys=True)
    return item

def tabify(response):
    table = ''
    if not isinstance(response, dict):
        try:
            response = json.loads(response)
        except Exception as e:
            raise Exception("Unable to convert response to JSON, reason: %s, please ensure you are sending either valid JSON or a python DICT to this method" % (e))

    print "tabify response: "
    pprint(response)
    print "\n\n"


    if response.get('aggregations'):
        tree = collectBucket(response['aggregations'])
        logger.debug('tabify treeeeee: %s' % print_json(tree))
        table = flatten(tree)

    print "\n\nOUR TABLE:"
    pprint(table)
    return table

def collectBucket(node, stack=[]):

    if not node:
        return
    
    #logger.debug("collectBucket node:\n%s" % (print_json(node)))
    #logger.debug("collectBucket node type: %s" % type(node))
    #logger.debug("collectBucket stack:\n%s" % (print_json(stack)))

    keys = node.keys()
    #logger.debug("collectBucket keys: %s" % (keys))

    for i, key in enumerate(keys):
        value = node[key]
        #logger.debug("collectBucket loop key => %s,\nvalue => \n%s" % (key, print_json(value)))
        #logger.debug("collectBucket loop value type: %s" % type(value))

        if isinstance(value, dict) or isinstance(value, list) and value:
            if isinstance(value, list):
                #[...stack, key] in javascript
                nstack = list(stack)
                nstack.append(key)
                return extractTree(value, nstack)

            if "buckets" == key and len(value.keys()) > 1:
                nstack = list(stack)
                nstack.append(key)
                return extractBuckets(value, nstack)
            #logger.debug('running collectBucket() with key = %s' % key)

            nstack = list(stack)
            nstack.append(key)
            # logger.debug("collectBuckets() - found a tree stack!!%s", nstack) 
            return collectBucket(value, nstack)
    
    #logger.debug('## end collect instance ##')
    return node

def extractBuckets(buckets, stack):
    #logger.debug("extractBuckets called:  buckets: %s, stack: %s" % (print_json(buckets),print_json(stack)))
    keys = buckets.keys() 
    results = [] 
    for i, key in enumerate(buckets):
        value = buckets[key]

        currentObject = collectBucket({[key]: value})

        if not currentObject:
            continue 
    
        currentObject[ stack[ len(stack) - 2 ] ] = key 
        results.append(currentObject)
    return results 

def extractTree(buckets, stack):
    tree = {}

    for bucket in buckets:
        for key in bucket.keys():
            value = bucket[key]
            if isinstance(value, dict):
                if "value" in value:
                    value = value.value
                else: 
                    nstack = list(stack)
                    nstack.append(key) 
                    value = collectBucket(value, nstack)
            if key == "key":
                key = stack[len(stack) - 2]
            tree[key] = value

    #logger.debug('extractTree items: %s' % (print_json(tree)))
    return tree

def flatten(tree, parentNode={}):
    #logger.debug('tree coming in %s' % (print_json(tree)))  
    if not tree:
        #logger.debug('no tree found, returning a list')
        return []

    if not isinstance(tree, list):
        #logger.debug('tree is not a list, converting it to one')
        tree = [tree]

    for i, childNode in enumerate(tree):
        # Object.assign in js
        temp = copy.deepcopy(parentNode)
        temp.update(childNode)
        tree[i] = temp

    logger.debug('flatten tree, with child pairs: %s' % (print_json(tree)))  
    for i, node in enumerate(tree):
        possibleChildTrees = node.keys()
        
        childTrees = []
        for el in possibleChildTrees:
            if isinstance(node[el], list) or isinstance(node[el], dict):
                childTrees.append(node[el])

        #logger.debug('child hmm : %s' % (print_json(childTrees)))
        if len(childTrees) == 0:
            tree[i] = node 
        elif len(childTrees) == 1: 
            childTree = childTrees[0]
            tree[i] = flatten(childTree, node)
        else:
            logger.debug('you goofed bad')

    return tree

#[ 
#    { 
#        'doc_count': 1,
#        'error_msg': 'bad juju',
#        'logstash_instance': 'whatever'
#    }
#]