import re
f = open("cases", "r")

caseLine = re.compile("\s*case\.*")
count = 0
no_case = 0

for line in f:
	if not caseLine.match(line):
		no_case += 1
		if no_case == 1:
			print("__device__ void pixelFunction" + str(count) + "(uint32_t *dp, int indexVier, int dpL, uint32_t *w, uint32_t *y) ")
			count += 1
		print(re.sub("\n", "", line))
	else:
		if no_case > 0:
			print("\n")
		no_case = 0

