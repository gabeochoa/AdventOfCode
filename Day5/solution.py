import sys
import md5

data = []

for line in sys.stdin:
    data.append(line)

def checkNiceOld(string):
	#ab cd pq xy
	if("ab" in string or "cd" in string or "pq" in string or "xy" in string):
		return False
	#contains 3 vowels, aeiou
	vcount = 0
	vcount += string.count('a')
	vcount += string.count('e')
	vcount += string.count('i')
	vcount += string.count('o')
	vcount += string.count('u')
	if(vcount < 3):
		return False
	#contains one letter that appears twice consecutively 
	for i in xrange(1,len(string)):
		if(string[i-1] == string[i]):
			return True
	return False

def checkNice(string):
	if(len(string) <= 3):
		return False
	#aba palidrome3
	
	for i in xrange(1,len(string)-1):
		if(string[i-1] == string[i+1]):
			break
	else:
		#print("Found no palidrome3")
		return False
	
	#like xyxy (xy) or aabcdefgaa (aa), 
	#but not like aaa (aa, but it overlaps)
	for j in xrange(0,len(string)-1):
		two = string[j] + string[j+1]
		for i in xrange(j+2,len(string)-1):
			if(two == (string[i]+string[i+1])):
				return True
	#print("Found no pair")
	return False

count = 0
for line in data:
	if checkNice(line):
		count += 1
print(count)