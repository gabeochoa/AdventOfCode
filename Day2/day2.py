import sys

data = []

for line in sys.stdin:
    data.append(line)
'''
'''

'''    _____
6      |K  |
_______|___|___
| T| V | B | F |
-------|---|---
	   |_R_|
'''
def getSmallest(a,b,c):
	extra = a

	if(a < b):
		if(a < c):
			extra = a
		else:
			extra = c
	else:
		#a not less than b -> b < a
		if(b < c):
			extra = b
		else:
			extra = c
	return extra

def getSurfaceArea(length, width, height):
	surfaceArea = 2*length*width + 2*width*height + 2*height*length
	front = length*height
	bottom = length*width
	right = height*width
	extra = getSmallest(front, bottom, right)

	return surfaceArea + extra

def getRibbonLength(length, width, height):
	vol = length*width*height
	s = (sorted([length, width, height]))[:2]
	ribbon = s[0]*2 + s[1]*2

	return vol + ribbon

sum = 0
ribbon = 0
for lin in data:
	dims = lin.split('x')
	sum += getSurfaceArea(int(dims[0]), int(dims[1]), int(dims[2]))
	ribbon += getRibbonLength(int(dims[0]), int(dims[1]), int(dims[2]))

print sum
print ribbon



