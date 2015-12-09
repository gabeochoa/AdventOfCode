import sys
import md5

data = []

for line in sys.stdin:
    data.append(line)

def checkMD5(key, number, match):
	m = md5.new(key + str(number)).hexdigest()
	#print(m[:5])
	if(m[:len(match)]==match):
		return True
	return False

def stocking(key, match):		
	count = 0
	while True:
		if(checkMD5(key.rstrip(), count, match)):
			return key + str(count)
		count += 1
		print(count)

print(stocking(data[0],"00000"))
print(stocking(data[0],"000000"))