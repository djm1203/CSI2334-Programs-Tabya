// Author:									Derek Martinez
// Assignment Title : P7_1 Palindrome
// Assignment Description : Determine whether an input is a palindrome
//
// Due Date : 11 - 27 - 2023
// Date Created : 11 - 20 - 2023
// Date Last Modified : 11 - 21 - 2023
//

#include <iostream>
#include <string>

using namespace std;

const short MAX = 21;

void __declspec(naked) palindrome(const char[], short, bool&) {
		__asm {
		START:
				push	ebp								//push ebp onto stack
				mov 	ebp, esp					//keep track of prev ebp
				push	ebx								//push ebx onto stack to hold char[]
				push	esi								//push esi onto stack to hold short
				push  edi								//push edi onto stack holds bool

				mov		esi, [ebp + 8]		//copy data to esi
				mov		cx, [ebp + 12]		//copy 
				mov   edi, [ebp + 16]		//copy bool val into edi
				dec		cx								//decrement loop counter
				mov		ebx, 0						//set ebx to 0
				
		CHECK:
				cmp		cx, bx						//compare counter to location
				jle		IS_PAL						//if less than 0 is palindrome

				mov		al, [esi + ebx]		//get first letter in array
				mov		dl, [esi + ecx]		//get last letter in array
				cmp		al, dl						//compare the letters
				jne		NOT_PALINDROME		//if not equal jump

				inc		ebx								//increment ebx
				dec		cx								//decrement cx
				jmp		CHECK							//jump back to check next letters

		NOT_PALINDROME:
				mov		BYTE PTR [edi], 0	//set isPalindrome to 0
				jmp		DONE							//jump to done

		IS_PAL:
				mov 	BYTE PTR [edi], 1 //set isPalindrome to 1

		DONE:
				pop   edi								//pop edi off stack
				pop		esi								//pop esi off stack
				pop		ebx								//pop ebx off stack
				pop		ebp								//pop ebp off stack

				sub		eax, eax					//set eax to 0
				ret											//finish running
		}
}

int main() {
		char input[MAX];
		int stringSize = 0;
		bool isPalindrome = true;

		cout << "Enter a string of characters: " << endl;
		cin.getline(input, MAX);

		while (input[stringSize] != '\0') {
				stringSize++;
		}
		
		palindrome(input, stringSize, isPalindrome);

		if (!isPalindrome) {
				cout << "Your string is NOT a palindrome." << endl;
		}
		else {
				cout << "Your string is a palindrome." << endl;
		}

		return 0;
}
