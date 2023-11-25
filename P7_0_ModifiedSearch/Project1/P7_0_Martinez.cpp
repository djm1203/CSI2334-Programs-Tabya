// Author:									Derek Martinez
// Assignment Title : P7_0 Modified Search
// Assignment Description : Read 10 16 bit values and create a linear search
// and find the minimum and maximum.
//
//
// Due Date : 11 - 09 - 2023
// Date Created : 11 - 09 - 2023
// Date Last Modified : 11 - 09 - 2023
//

#include <iostream>

using namespace std;

const short MAX = 10;
short myArray[MAX];
short key;
short ndx;

void __declspec(naked) seqSearch() {
	__asm {
	START:
			lea			ebx, myArray + 20	//point to end of array
			move		ax, key						//set ax to key
			mov			cx, 9							//set ecx to counter

	SEARCH:
			sub			ebx, 2						//mov to prev element
			cmp			[ebx], ax					//compare ebx to ax
			je			DONE							//jump if equal
			dec			cx
			loop		SEARCH						//loop search

	NOT_FOUND:
			mov			ndx, -1						//if not found set to -1

	DONE:
			mov			ndx, cx						//move index value to ndx
			sub			ax, ax						//set eax to 0
			ret												//return
	}
}

int main() {
	cout << "Enter an array of ten 16-bit values:" << endl;
	for (int i = 0; i < MAX; i++) {
		cin >> myArray[i];
	}

	cout << "Enter a search key: ";
	cin >> key;
	seqSearch();

	if (ndx != -1) {
		cout << "The last occurrence of the search key was at index " << ndx << "." << endl;
	}
	else {
		cout << "The last occurrence of the search key was NOT found in this list." << endl;
	}
	return 0;
}