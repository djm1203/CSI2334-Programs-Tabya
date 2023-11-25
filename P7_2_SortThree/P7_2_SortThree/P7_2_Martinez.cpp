// Author:									Derek Martinez
// Assignment Title : P7_2 Sort Three
// Assignment Description : Sort three 32 bit values
//
// Due Date : 11 - 27 - 2023
// Date Created : 11 - 21 - 2023
// Date Last Modified : 11 - 22 - 2023
//

#include <iostream>
#include <string>

using namespace std;

void __declspec(naked) sortThree(int&, int&, int&) {
	__asm {
	START:
			push  ebp								//keep track of previous ebp				
			mov		ebp, esp					//move ebp to esp
			push  esi								//push esi onto stack

	SET_VALS:
			mov   esi, [ebp + 8]		//move esi to min val
			mov   eax, [esi]				//copy min val to esi

			mov   esi, [ebp + 12]		//move esi to mid val
			mov   ebx, [esi]				//copy mid val to ebx	

			mov   esi, [ebp + 16]		//mov esi to maxVal
			mov   ecx, [esi]				//copy max val to ecx

	SWAPPING:
			cmp		eax, ebx					//compare min val with mid val
			jg    SWAP_MIN_MID			//jump if greater
			cmp		ebx, ecx					//compare mid val with max val
			jg    SWAP_MID_MAX			//jump if greater
			cmp   eax, ebx					//compare min val with max val
			jg    SWAP_MIN_MID			//jump if greater

			jmp   DONE							//if sorted jump to done

	SWAP_MIN_MID:
			xchg	eax, ebx					//swap min val with mid val
			jmp   DONE							//jump to done

	SWAP_MID_MAX:
			xchg	ebx, ecx					//swap mid val with max val
			jmp		SWAP_MIN_MID			//jump to swap min mid

	DONE:
			mov		esi, [ebp + 8]		//get address of min val
			mov		[esi], eax				//store eax in min val

			mov		esi, [ebp + 12]		//get address of mid val
			mov		[esi], ebx				//store ebx in mid val

			mov		esi, [ebp + 16]		//get address of max val
			mov		[esi], ecx				//store ecx in max val

			pop		esi								//pop esi off stack
			pop		ebp								//pop ebp off stack

			sub		eax, eax					//set eax to 0
			ret											//finish running
	}
}

int main() {
	int minVal, midVal, maxVal;
	cout << "Please enter three integer values: ";
	cin >> minVal >> midVal >> maxVal;
	cout << minVal << " " << midVal << " " << maxVal << endl;

	sortThree(minVal, midVal, maxVal);

	cout << "Your three values, in ascending order: " << endl;
	cout << minVal << " " << midVal << " " << maxVal << endl;

	return 0;
}
