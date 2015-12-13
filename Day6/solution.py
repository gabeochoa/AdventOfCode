import sys

data = []

for line in sys.stdin:
    data.append(line)

grid = [[ 0 for y in range(0, 1000)] for x in range(0, 1000)]

def _oldchangeLight(x, y, mode):
	if(mode == 0):
		grid[x][y] = 0
	elif( mode == 1):
		grid[x][y] = 1
	else:
		if(grid[x][y] == 0):
			grid[x][y] = 1
		else:
			grid[x][y] = 0

def changeLight(x, y, mode):
	if(mode == 0):
		grid[x][y] -= 1
	elif( mode == 1):
		grid[x][y] += 1
	else:
		grid[x][y] += 2

	if(grid[x][y] < 0):
		grid[x][y] = 0;


def between(startstr, endstr, mode):
	start = startstr.split(',')
	end = endstr.split(',')

	for x in range(int(start[0])-1, int(end[0])):
		for y in range(int(start[1])-1, int(end[1])):
			changeLight(x,y,mode)

def processCommand(line):
	cmd = line.split(' ')
	if(len(cmd) == 4):
		#toggle
		print("toggle")
		between(cmd[1], cmd[3], 2)
		return
	elif(cmd[1] == 'on'):
		#turn on
		print("on")
		between(cmd[2], cmd[4], 1)
	else:
		#turn off
		print("off")
		between(cmd[2], cmd[4], 0)


for line in data:
	processCommand(line)

count = 0
'''
for x in range(len(grid)):
	for y in range(len(grid[x])):
		if(grid[x][y]):
			count+=1
'''

for x in range(len(grid)):
	for y in range(len(grid[x])):
		count+= grid[x][y]
print(count)