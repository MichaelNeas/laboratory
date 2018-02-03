import sys

if len(sys.argv) == 2:
	print("Haaiiiiiii, Mike, {0}".format(sys.argv[1]))
else: 
	sys.stderr.write("Usage: {0} <name> \n".format(sys.argv[0]))
