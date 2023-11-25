;Author:                  Derek Martinez
;Assignment Title:        P6_2 Sum of Inputs
;Assignment Description:  read positive inputs and get sum or
;													terminate if value is greater than 5000
;													or if 10 0's are inputted
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
sumLbl		BYTE		"The sum is:"				    			; create sum label
sum		  	BYTE		11 DUP (?), 0dh, 0ah					; create buffer for result
zeroLbl		BYTE		"Number of Zeros:"						; create zero label
numZeros	BYTE		6 DUP (?), 0							  	; create buffer for num of zeros

.CODE
_MainProc PROC
		mov 			bx, 0 														; copy one to ebx
		mov       dx, 0															; copy value to edx

		INPUT_LOOP:
			input		prompt1, string, 40								; read user input
			atow		string														; convert ascii to hex
			cmp			ax, 0															; compare eax to 0
			jnz			NOT_ZERO													; jump if zero
			inc			dx																; increment to 0
			cmp			dx, 10														; compare dx to 10
			je			DONE															; jump to done if equal

		NOT_ZERO:
			add			bx, ax	  												; multiply ebx by eax
			cmp			bx, 5000													; compare dx to 5000
			jge			DONE															; jump if greater or equal
			loop		INPUT_LOOP												; loop to INPUT_LOOP

		DONE:
			wtoa		sum, bx														; convert to ascii
			wtoa		numZeros, dx											; convert to ascii
			output	resultLbl, sumLbl									; output labels

		sub			eax, eax														; set eax to 0
		ret																					; return from program
_MainProc ENDP
END																							; end of program