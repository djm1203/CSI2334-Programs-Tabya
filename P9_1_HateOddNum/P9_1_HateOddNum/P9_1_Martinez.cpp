// Author:									Derek Martinez
// Assignment Title : P9_1  Hate Odd Numbers
// Assignment Description : read 10 16 bit values,
//		if any values are odd change the number to even
//		and count how many values were changed
//
// Due Date : 12 - 01 - 2023
// Date Created : 11 - 30 - 2023
// Date Last Modified : 11 - 30 - 2023
//

#include <iostream>

using namespace std;

void __declspec(naked) changeNum(short[], short, short&) {
	__asm {
	START:
		push	ebp											//preserve ebp
		mov		ebp, esp								//copy esp to ebp
		push	eax											//push eax to stack
		push	ebx											//push ebx to stack
		push  ecx											//push ecx to stack
		push	edx											//push edx to stack
		pushfd												//push flag bits to stack

		mov		ebx, [ebp + 8]					//copy address
		mov		ecx, [ebp + 12]					//copy size
		sub		edx, edx								//clear edx

	TOP:
		mov		ax, [ebx]								//copy value to ax
		test  ax, 1										//test for odd
		jz    NOT_ODD									//if zero jump
		inc		dx											//increment dx

		and   WORD PTR [ebx], 0xFFFE	//make odd

	NOT_ODD:
		add		ebx, 2									//check next value
		loop  TOP											//loop to TOP

	DONE:
		mov   ebx, [ebp + 16]					//copy counter address
		mov		[ebx], dx								//copy counter

		popfd													//pop flag bits off stack
		pop		edx											//pop edx off stack
		pop		ecx											//pop ecx off stack
		pop		ebx											//pop ebx off stack
		pop   eax											//pop eax off stack
		mov   esp, ebp								//copy ebp to esp
		pop   ebp											//pop ebp off stack
		ret														//finish running
	}
}

int main() {
	const short SIZE = 10;
	short arr[SIZE];
	short counter;

	cout << "Please enter 10 values (-32, 768 to 32, 767): ";
	for (int i = 0; i < SIZE; i++) {
		cin >> arr[i];
	}
	for (int i = 0; i < SIZE; i++) {
		cout << arr[i] << " ";
	}
	cout << endl << endl;

	changeNum(arr, SIZE, counter);

	cout << "The values, after modification, are:" << endl;
	for (int i = 0; i < SIZE; i++) {
		cout << arr[i] << " ";
	}
	cout << endl;

	cout << "and there were " << counter << " odd values" << endl;
	return 0;
}


