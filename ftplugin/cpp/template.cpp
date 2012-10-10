#include <iostream>
#include <fstream>
#include <cstdio>

int cpp4cf_main()
{
	int a, b;
	cin>>a>>b;
	cout<<a+b;
	return 0;
}

int main()
{
	freopen("input.txt", "r", stdin);
	freopen("output.txt", "w", stdout);
	char s[10];
	int N;

	getline(s, 9);
	sscanf("%d", &N);

	while(N-->0)
		cpp4cf_main();

	return 0;
}
