print "="*25, "Exercise 13/14", "="*25

from sys import argv

script, userName = argv
prompt = '> '

print "Hi %s, I'm the %s script.", (userName, script)
print "Question time!"
print "Do you favor me %s?" %  userName
favors = raw_input(prompt)

print "Where do you live %s?" %  userName
inhabits = raw_input(prompt)

print "What kind of computer do you have?"
computer = raw_input(prompt)

print """
So you said %r about liking me.
You live in %r.  Cool.
And you have a %r computer. Also kewl.
""" %(favors, inhabits, computer)
