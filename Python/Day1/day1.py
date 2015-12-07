import sys

data = []

for line in sys.stdin:
    data.append(line)
'''
'''

floor = 0
for index in range(len(data[0])):
	if(data[0][index] is '('):
		floor += 1
	else:
		floor -= 1
	if(floor == -1):
		floor = index + 1
		break

print floor 


