// Author:									Derek Martinez
// Assignment Title : P9_2  Even Parity
// Assignment Description : count number of 1 bits in a string
// 						if it is odd set parity bit-7 to one
//
// Due Date : 12 - 01 - 2023
// Date Created : 11 - 30 - 2023
// Date Last Modified : 11 - 30 - 2023
//

#include <iostream>
#include <cstring>

using namespace std;

void __declspec(naked) evenParity(char[]) {
	__asm {
	START:
			push		ebp									//push ebp to stack
			mov			ebp, esp						//move esp to ebp
			push		eax									//push eax to stack
			push		ebx									//push ebx to stack
			push    ecx									//push ecx to stack
			pushfd											//push flag bits to stack

			mov			ebx, [ebp + 8]			//point to array
			sub     eax, eax						//clear eax

	TRAVERSE:
			mov			al, [ebx]						//copy character
			cmp     al, '\0'						//check for null character
			je      DONE								//if at end jump to done

			mov     cx, ax							//copy character to ax
			sub			eax, eax						//clear eax

	COUNT:
			cmp			cx, 0								//compare cx to 0
			je			NEXT								//jump to next
			shr			cx, 1								//shift right 1 bit
			jnc			COUNT								//if bit shifted is 0 jump
			inc			ax									//increment ax
			jmp			COUNT								//jump to count

	NEXT:
			test		ax, 1								//check if count is odd
			jz			SKIP								//if even jump
			xor     BYTE PTR [ebx], 0x80//else set high bit

	SKIP:
			inc			bx									//increment bx
			jmp			TRAVERSE						//go to next character

	DONE :
			popfd												//pop flag bits off stack
			pop     ecx									//pop ecx off stack
			pop			ebx									//pop ebx off stack
			pop     eax									//pop eax off stack
			mov     esp, ebp						//restore ebp
			pop     ebp									//pop ebp off stack
			ret													//finish running
	}
}

int main()
{
		const int MAX = 80;
		char arr[MAX];

		cout << "Enter a message (<=80 characters): ";
		cin.getline(arr, MAX);

		cout << "The character array BEFORE we implement even parity:" << endl;
		cout << arr << endl << endl;
		
		evenParity(arr);

		cout << "The character array AFTER we implement even parity:" << endl;
		cout << arr << endl;

}
