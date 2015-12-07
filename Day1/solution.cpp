#include <iostream>
#include <string>
#include <vector>
using namespace std;

int
main()
{
	vector<string> data;
	for(string line; getline(cin, line);)
	{
		data.push_back(line);
	}

	int floor = 0;
	int index = -1;
	for(size_t i =0; i<data[0].size(); i++)
	{
		if(data[0][i] == '(')
			floor++;
		else
			floor--;

		if(floor == -1 && index == -1)
			index = i+1;
	}
	cout << floor << " " << index << endl;	
}
