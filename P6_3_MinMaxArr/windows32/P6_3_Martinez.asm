;Author:									Derek Martinez
;Assignment Title:				P6_3 Min-Max Array
;Assignment Description:	Read twenty 32-bit values 
;													and find the minimum and maximum.
;
;
;Due Date:                11-07-2023
;Date Created:            11-01-2023
;Date Last Modified:      11-06-2023
;

.586
.MODEL FLAT

INCLUDE io.h			; header file for input/output
 
.STACK 4096				; set stack size to 4096 bytes

.DATA
prompt1		BYTE		"Enter positive values", 0	; create prompt for values
string		BYTE		11 DUP (?)									; create buffer for strings
values		DWORD		20 DUP (?)									; create buffer for array
resultLbl BYTE    "Result", 0									; create result label
minLbl		BYTE		"The min is: "			        ; create min label
min		  	BYTE		11 DUP (?), 0dh, 0ah				; create buffer for min
maxLbl		BYTE		"The max is: "							; create max label
max				BYTE		11 DUP (?), 0					  		; create buffer for max

.CODE
_MainProc PROC
		START:
		  lea				ebx, values										; address of values in ebx
			mov				ecx, 20												; copy value to ecx
			

		INPUT_LOOP:
			input		prompt1, string, 20							; read user input
			atod		string													; convert from ascii to decimal
			mov			[ebx], eax											; mov eax to ebx
			add			ebx, 4													; move to next location
			loop		INPUT_LOOP											; loop to INPUT_LOOP

			lea			ebx, values											; address of values in ebx
			mov			eax, [ebx]											; copy first value to min	
			mov			edx, [ebx]											; copy first value to max
			add     ebx, 4													; move to second value
			mov			ecx, 19													; reset ecx counter

		FIND_MIN_MAX:
			cmp			[ebx], eax											; compare ebx to eax
			jnl			UPDATE_MAX											; if not less move to max
			mov			eax, [ebx]											; copy min value 

		UPDATE_MAX:
			cmp			[ebx], edx											; compare ebx to edx
			jng			NO_SWITCH												; if not greater move to loop
			mov			edx, [ebx]											; mov ebx value to edx
			
		NO_SWITCH:
			add			ebx, 4													; add 4 to ebx
			loop		FIND_MIN_MAX										; loop back to finding loop

		DONE:
			dtoa		min, eax												; convert decimal to ascii
			dtoa		max, edx												; convert decimal to ascii
			output	resultLbl, minLbl								; output results
			

		sub			eax, eax													; set eax to 0
		ret																				; return from program
_MainProc ENDP
END																						; end of program