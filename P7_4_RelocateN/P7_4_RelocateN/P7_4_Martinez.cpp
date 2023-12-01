// Author:									Derek Martinez
// Assignment Title : P7_4  Relocate N
// Assignment Description : read 10 values to an array
//									ask user which value to move to beginning of array
//
// Due Date : 11 - 29 - 2023
// Date Created : 11 - 23 - 2023
// Date Last Modified : 11 - 29 - 2023
//

#include <iostream>

using namespace std;

void __declspec(naked) relocateN(short[], short) {
	__asm {
	START:
			push		ebp
			mov			ebp, esp
			push		esi 

			mov			esi, [ebp + 8]	//move address of array to esi
			mov			ax, [ebp + 12]	//move address of index to ax
			dec			ax							//decrement to get real index val
			mov			dx, ax					//store ndx in dx
			mov     edi, esi				//move edi to start of array
			imul		eax, 2					//multiply eax by 2
			add			edi, eax				//move edi to ndx

			mov     bx, [edi]				//move value at index to bx
			mov     cx, dx					//set loop counter
			sub     edi, 2					//move pointer 2 behind

	SHIFTING:
			cmp     cx, 0						//compare cx to 0
			je			DONE						//if at start jump to DONE
			mov     dx, [edi]				//copy current value to dx
			mov     [edi + 2], dx		//shift value to right
			sub			edi , 2					//move to previous element
			dec     cx							//decrement cx
			jmp     SHIFTING				//jump back up to SHIFTING

	DONE:
			mov     [esi], bx				//move value to first ndx
			pop     esi							//pop esi off the stack
			pop     ebp							//pop ebp off the stack
			
			ret											//finish running
	}
}

int main() {
	short arr[10];
	short ndx;
	short val;

	cout << "Please enter ten integer values: ";
	for (int i = 0; i < 10; i++) {
		cin >> arr[i];
	}

	cout << endl << "Enter which of these to move to the first position: ";
	cin >> val;

	relocateN(arr, val);

	cout << endl << "Your list of ten values, modified, is:" << endl;
	for (int i = 0; i < 10; i++) {
		cout << arr[i] << " ";
	}

	return 0;
}

