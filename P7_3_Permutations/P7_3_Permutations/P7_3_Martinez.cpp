// Author:									Derek Martinez
// Assignment Title : P7_3 Permutations
// Assignment Description : create a function to calculate the permutations
//													given n k and put in result
//
// Due Date : 11 - 29 - 2023
// Date Created : 11 - 22 - 2023
// Date Last Modified : 11 - 29 - 2023
//

#include <iostream>

using namespace std;

void __declspec(naked) calcPerm(int, int, int&) {
	__asm {
	START:
			push  ebp								//keep track of previous ebp				
			mov		ebp, esp					//move ebp to esp
			push  esi								//push esi to stack
			push  edi								//push edi to stack
			push  ecx								//push ecx to stack
			push  ebx								//push edx to stack
			push  eax								//push ebx to stack

			mov   ecx, [ebp + 8]		//move val in address to eax (n)
			mov   ebx, [ebp + 12]		//move val in address to ebx (k)
			mov   edi, [ebp + 16]		//move val in address to edi (result)
			mov   eax, 1						//set eax to 1
			mov   esi, ecx					//store n in esi
			sub   ecx, ebx					//subtract ebx from ecx

	CALC_NUM:										//n!
			cmp   esi, ecx					//compare esi and ecx
			je    DONE							//jump to DONE
			mul   esi								//multiply esi by eax
			dec   esi								//decrement esi by 1
			jmp   CALC_NUM					//jump to CALC_NUM

	DONE:		
			mov   [edi], eax				//store eax in result

			pop   eax								//pop eax off stack
			pop   ebx								//pop ebx off stack
			pop   ecx								//pop ecx off stack
			pop   edi								//pop edi off stack
			pop   esi								//pop esi off stack
			pop   ebp								//pop ebp off stack

			ret											//finish running
	}
}

int main() {
	int n, k, result;

	cout << "Enter positive integers n and k: ";
	cin >> n >> k;

	cout << "P(" << n << "," << k << ")";

	if (n >= 0 && k >= 0) {
		calcPerm(n, k, result);
		cout << " = " << result << endl;
	}
	else {
		cout << " --> undefined" << endl;
	}

	return 0;
}
