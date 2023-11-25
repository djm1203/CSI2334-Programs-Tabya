;Author:                  Derek Martinez
;Assignment Title:        P4_0 Evaluate an Expression
;Assignment Description:  takes in x, y, and z values. Then
;													evaluates the expression 5x + 5y - 2z
;
;
;Due Date:                10-12-2023
;Date Created:            10-08-2023
;Date Last Modified:      10-08-2023
;

.586
.MODEL FLAT

INCLUDE io.h			; header file for input/output

.STACK 4096				; set stack size to 4096 bytes

.DATA
prompt1		BYTE		"Enter number of apples", 0	 ; create prompt for first number
prompt2		BYTE		"Enter number of oranges", 0 ; create prompt for second number
prompt3		BYTE		"Enter number of bananas", 0 ; create prompt for second number
string		BYTE		40 DUP (?)									 ; create buffer for inputs
resultLbl BYTE		"The total is", 0						 ; create result label
sum			BYTE		11 DUP (?), 0									 ; create buffer for result

.CODE
_MainProc PROC
		input		prompt1, string, 40		; read the input of first number
		atod		string								; convert ASCII to integers
		mov			ebx, eax							; store values in memory

		input		prompt2, string, 40		; read the input of second number
		atod		string								; convert ASCII to integers
		add			ebx, eax							; add first to second number

		mov			eax, ebx							; copy value to eax
		add			ebx, ebx							; double ebx value
		add			ebx, ebx							; double ebx value again
		add			ebx, eax							; add eax to ebx 5th multi

		input		prompt3, string, 40		; read the input of third number
		atod		string								; convert ASCII to integers

		add			eax, eax							; double eax value
		neg			eax										; convert value to negative
		add			eax, ebx							; add numbers together

		dtoa		sum, eax							; convert diff to ASCII
		output	resultLbl, sum				; display the resultLbl and difference

		mov			ebx, ebx							; set ebx to 0
		ret														; return from program
_MainProc ENDP
END																; end of program