# -*- coding: utf-8-*-
# This allows for non-ASCII characters to not get encoding errors.
myName = 'Mike Neas'
myAge = 22
myHeight = 6 * 12 + 1 #inches
myWeight = 208
myEyes = 'Blue'
myTeeth = 'White-ish'
myHair = 'Brown'

print "Let's talk about %s." % myName
print "I'm %d inches tall, and %d pounds heavy." % (myHeight, myWeight)
print "I'm about to make a major change in my life."
print "I have %s eyes and %s hair." % (myEyes, myHair)
print "My teeth are %s, depending on the day." % myHair

print "If I add %d, %d, and %d I get %d." % (myAge, myHeight, myWeight, myAge + myHeight + myWeight)
print "-" * 25, "Exercise 6", "-"*25 

#exercise 6
x = "There are %d types of people." % 10
binary = "binary"
doNot = "don't"
y = "Those who know %s and those who %s." % (binary, doNot)

print x, y

print "I said: %r." % x
print "I also said: '%s'." % y

hilarious = False
jokeEvaluation = "Isn't that joke so funny?! %r"

print jokeEvaluation % hilarious

#also a concatenation
print x + y

print "*" * 25, "Exercise 7", "*"*25 

#exercise 7
print "Mary had a little lamb."
print "Its fleece was white as %s." % 'snow'
print "And everywhere that Mary went."
print "." * 25 #Print mad dots
var1 = "C"
var2 = "h"
var3 = "e"
var4 = "s"
var5 = "B"
var6 = "u"
var7 = "r"
var8 = "g"

print var1 + var2 + var3 + var3 + var4 + var3,
print var5 + var6 + var7 + var8 + var3 + var7

print "#" * 25, "Exercise 8", "#"*25 

#exercise 8
formatter = "%r %r %r %r"
print formatter % (1, 2, 3, 4)
print formatter % ("one", "two", "three", "four")
print formatter % (True, False, False, True)
print formatter % (formatter, formatter, formatter, formatter)
print formatter % (
	"I had this thing.",
	"That you could type up right.",
	"But it didn't sing.",
	"So I said goodnight."
)

print "$" * 25, "Exercise 10", "$"*25 

#exercise 10
tabbyCat = "\tI'm tabbin in."
persianCat = "I'm split\non a line."
backSlashCat = "I'm \\ a \\ cat."

fatCat = """
A list!:
\t* Cat Food
\t* Fishes 
\t* Catnip\n\t* Grass
"""

print tabbyCat
print persianCat
print backSlashCat
print fatCat

print "&" * 25, "Exercise 11", "&"*25 

age = raw_input("How old are you? ")
height = raw_input("How tall are you? ")

print "How much do you weight?",
weight = raw_input()

print "So, you're %r old, %r tall and %r heavy." % (age, height, weight)


