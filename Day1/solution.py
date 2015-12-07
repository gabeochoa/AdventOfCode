import sys

data = []

for line in sys.stdin:
    data.append(line)
'''
'''

floor = 0
ind = -1
for index in range(len(data[0])):
	if(data[0][index] is '('):
		floor += 1
	else:
		floor -= 1
	if(floor == -1 and ind == -1):
		ind = index + 1

print floor,
print ind
assert floor == 280
assert ind == 1797


