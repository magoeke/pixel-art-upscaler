import re
f = open("cases", "r")

caseLine = re.compile("\s*case\.*")
breaks = re.compile("\s*break;")
count = 0

for line in f:
	if breaks.match(line):
		count += 1
	if caseLine.match(line):	
		number = re.sub("\s*case\s*", "", line)
		number = re.sub("\s*:\n","", number)
		print("FunctionPointer["+number+"] = pixelFunction" +str(count) + ";")


