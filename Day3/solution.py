import sys

data = []

for line in sys.stdin:
    data.append(line)

def santa():
	visited = set()
	x = 0
	y = 0
	a = 0
	b = 0
	visited.add((x,y))
	for char in data[0]:	
		if(char == '>'):
			x+=1
		elif(char == 'V' or char == 'v'):
			y+=1
		elif(char == '<'):
			x-=1
		elif(char == '^'):
			y-=1
		visited.add((x,y))
	print(len(visited))
def robot():
	visited = set()
	x = 0
	y = 0
	a = 0
	b = 0
	visited.add((x,y))
	for j in range(len(data[0])):
		char = data[0][j]
		if(j % 2 == 0):
			if(char == '>'):
				a+=1
			elif(char == 'V' or char == 'v'):
				b+=1
			elif(char == '<'):
				a-=1
			elif(char == '^'):
				b-=1
			visited.add((a,b))
		else:
			if(char == '>'):
				x+=1
			elif(char == 'V' or char == 'v'):
				y+=1
			elif(char == '<'):
				x-=1
			elif(char == '^'):
				y-=1
			visited.add((x,y))
	print(len(visited))
santa()
robot()