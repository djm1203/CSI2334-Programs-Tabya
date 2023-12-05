// Author:									Derek Martinez
// Assignment Title : P9_0  Switch Case
// Assignment Description : read a string input from user
//			then switch the case of any letters in the input
//
// Due Date : 12 - 01 - 2023
// Date Created : 11 - 30 - 2023
// Date Last Modified : 11 - 30 - 2023
//

#include <iostream>
#include <cstring>

using namespace std;

void __declspec(naked) conv2Lower(char []) {
	__asm {
	START:
			push		ebp									//push ebp to stack
			mov			ebp, esp						//move esp to ebp
			push		eax									//push eax to stack
			push		ebx									//push ebx to stack
			pushfd											//push flag bits to stack

			mov			ebx, [ebp+8]				//load start address of array

	TOP:
			mov			al, [ebx]						//copy curr character to al
			cmp			al, '\0'						//compare to null character
			je			DONE								//jump if at end of string
			cmp			al, 'A'							//compare to upper case A
			jb			LOWER_CASE					//jump if below to lower
			cmp			al, 'Z'							//copmare to Z
			ja			LOWER_CASE					//jump to next if greater
			
			jmp     SWAP_CASE						//jump to swap

	LOWER_CASE:
			cmp     al, 'a'							//check for upper case
			jb			NEXT								//jump if below
			cmp     al, 'z'							//check for upper case
			ja      NEXT								//jump if above

	SWAP_CASE:
			xor     BYTE PTR[ebx], 20h	//switch case

	NEXT:
			inc			ebx									//increment to next character
			jmp			TOP									//jump to TOP

	DONE:
			popfd												//pop flag bits off stack
			pop			ebx									//pop ebx off stack
			pop     eax									//pop eax off stack
			mov     esp, ebp						//restore ebp
			pop     ebp									//pop ebp off stack
			ret													//finish running
	}
}

int main() {
	const int MAX = 100;
	char arr[MAX];

	cout << "Please enter a string of characters:" << endl;
	cin.getline(arr, MAX);
	cout << arr << endl << endl;

	conv2Lower(arr);

	cout << "Your string after it is converted:" << endl;
	cout << arr << endl;

	return 0;
}

