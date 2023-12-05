// Author:									Derek Martinez
// Assignment Title : P10_0  Volume of Egg
// Assignment Description : this program reads
//				values for the diameter and longitude of
//				an egg and calculates the volume
//
// Due Date : 12 - 07 - 2023
// Date Created : 12 - 04 - 2023
// Date Last Modified : 12 - 05 - 2023
//

#include <iostream>
#include <iomanip>

using namespace std;

void __declspec(naked) asmEgg(float, float, int, float&) {
	__asm {
	START:
		push		ebp										//push ebp to stack
		mov			ebp, esp							//copy esp to ebp
		push		ebx										//push ebx to stack
		pushfd												//push flag bits to stack
				
		finit													//initialize FPU
		fldpi													//push pi to ST
	  fidiv   DWORD PTR [ebp + 16]	//divide pi by 6
		fld     DWORD PTR [ebp + 8]		//push length to ST
		fmul													//pop ST, ST(1) and multiply
		fld     DWORD PTR [ebp + 12]	//push diameter to ST
		fmul    ST(0), ST							//square ST(0) or diameter
		fmul													//multiply and pop ST, ST(1)

		mov			ebx, [ebp + 20]				//move volume address to ebx
		fstp    DWORD PTR [ebx]				//pop volume to ebx

	DONE:
		popfd													//pop flag bits off stack
		pop			ebx										//pop ebx off stack
		mov     esp, ebp							//copy ebp to esp
		pop     ebp										//pop ebp off stack
		ret 
	}
}

int main() {
	float length;
	float diameter;
	float volume;

	cout << "Enter the lenght of the egg:" << endl;
	cin >> length;

	cout << "Enter the maximum diameter of the egg:" << endl;
	cin >> diameter;
	cout << endl;

	asmEgg(length, diameter, 6, volume);

	cout << "The volume of the egg is:" << endl;
	cout << fixed << setprecision(2);
	cout << volume << endl;
	return 0;
}

