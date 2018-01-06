def extractTree(buckets, stack):
  tree = {}
  for bucket in buckets:
    for key in bucket.keys():
      value = bucket[key]
      if type(value) == “dict”:
        if “value” in value:
          value = value.value
        else:
          value = collectBucket(value, stack.append(key))
      if key == “key”:
        key = stack[len(stack) - 2]
      tree[key] = value
  return tree