#response = raw_input("Hey Man\n ")
#response2 = raw_input("whats good\n")

#print "%r , %r" % (response, response2)

from sys import argv

script, first, second, third = argv

print "Argument shtuff:", script
print "Again? ", first
print "Stahp", second
print "Ayee", third