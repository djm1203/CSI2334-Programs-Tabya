;Author:                  Derek Martinez
;Assignment Title:        P3_1 Subtract Two Values
;Assignment Description:  create a program that gets the difference of two numbers
;
;
;Due Date:                9-26-2023
;Date Created:            9-25-2023
;Date Last Modified:      9-25-2023
;

.586
.MODEL FLAT

INCLUDE io.h					; header file for input/output

.STACK 4096						; set stack size to 4096 bytes

.DATA
prompt1		BYTE		"Enter first number", 0						; create prompt for first number
prompt2		BYTE		"Enter second number", 0					; create prompt for second number
string		BYTE		40 DUP (?)												; create buffer for inputs
resultLbl BYTE		"The difference is", 0						; create result label
diff			BYTE		11 DUP (?), 0											; create buffer for result

.CODE
_MainProc PROC
		input		prompt 1, string, 40											;	read the input of first number
		atod		string																		;	convert ASCII to integers
		move		ebx, eax																	;	store values in memory

		input		prompt2, string, 40												;	read the input of second number
		atod		string																		;	convert ASCII to integers
		sub			eax, ebx																	;	subtract first from second number

		mov			eax, eax																	; store values in memory

		dtoa		diff, eax																	; convert diff to ASCII
		output	resultLbl, diff														; display the resultLbl and difference
		ret																								; return from program
_MainProc ENDP
END																										; end of program