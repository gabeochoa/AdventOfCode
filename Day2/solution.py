import sys

data = []

for line in sys.stdin:
    data.append(line)

'''    _____
6      |K  |
_______|___|___
| T| V | B | F |
-------|---|---
	   |_R_|
'''
def getSmallest(a,b,c):
	return int((sorted([a, b, c]))[:1][0])

def getSurfaceArea(length, width, height):
	surfaceArea = 2*length*width + 2*width*height + 2*height*length
	extra = getSmallest(length*height, length*width,  height*width)
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

print sum,
print ribbon



