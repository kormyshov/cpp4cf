/* Test on
2 3
// 5
*/

/* Test on
100 1
// 101
*/

/* Test off
0 0
// 0
*/

/* Test on
-1 1
// 0
*/

#include <iostream>
#include <fstream>
#include <cstdio>
#include <cstring>

using namespace std;

int cpp4cf_main()
{
	int a, b;
	cin>>a>>b;
	cout<<a+b;
	return 0;
}


// [[MAIN]]
int main()
{
	freopen("template.cpp", "r", stdin);

	char s[99];
	bool f;

	while(true) {
		cin>>s;
		if(cin.eof()) break;
		if(strstr(s,"/*")){
			cin>>s;
			if(strstr(s,"Test")){
				cin>>s;
				if(strstr(s,"on")){
					cout<<"Output: ";
					cpp4cf_main();
					cout<<"\nAnswer: ";
					f = false;
					while(true) {
						cin>>s;
						if(strstr(s,"*/")) break;
						if(strcmp(s,"//") == 0){
							if(f) cout<<endl;
							else f = true;
						}
						else cout<<s<<" ";
					}
					cout<<"\n\n";
				}
			}
		}
	}

	return 0;
}
// [[end cpp4cf]]
/* Test on
7 8
// 15
*/
