;Author:                  Derek Martinez
;Assignment Title:        P6_1 Product Of Positives
;Assignment Description:  read ten positive inputs and get product
;
;
;Due Date:                11-7-2023
;Date Created:            10-30-2023
;Date Last Modified:      11-01-2023
;

.586
.MODEL FLAT

INCLUDE io.h			; header file for input/output

.STACK 4096				; set stack size to 4096 bytes

.DATA
prompt1		BYTE		"Enter positive values", 0		; create prompt for values
string		BYTE		20 DUP (?)										; create buffer for inputs
resultLbl BYTE    "Result", 0										; create result label
prodLbl		BYTE		"The product is:"							; create result label
prod			BYTE		11 DUP (?), 0dh, 0ah					; create buffer for result
zeroLbl		BYTE		"Number of Zeros:"						; create zero label
numZeros	BYTE		6 DUP (?), 0							  	; create buffer for num of zeros

.CODE
_MainProc PROC
		mov 			ebx, 1														; copy one to ebx
		mov       dx, 0															; copy value to edx
		mov				cx, 10														; copy value to ecx

		INPUT_LOOP:
			input		prompt1, string, 40								; read user input
			atow		string														; convert ascii to hex
			cmp			ax, 0															; compare eax to 0
			jnz			NOT_ZERO													; jump if zero
			inc			dx																; increment to 0
			cmp			dx, 0															; compare dx to 0
			jne			INPUT_LOOP												; jump if not 0

		NOT_ZERO:
			movzx		eax, ax
			imul		ebx, eax													; multiply ebx by eax
			loop		INPUT_LOOP												; loop to INPUT_LOOP

		DONE:
			dtoa		prod, ebx													; convert to ascii
			wtoa		numZeros, dx											; convert to ascii
			output	resultLbl, prodLbl								; output labels

		sub			eax, eax														; set eax to 0
		ret																					; return from program
_MainProc ENDP
END																							; end of program