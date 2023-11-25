;Author:                  Derek Martinez
;Assignment Title:        P5_1 Weighted Average
;Assignment Description:  computes weighted average of 4 user
;													inputted scores
;
;
;Due Date:                10-22-2023
;Date Created:            10-18-2023
;Date Last Modified:      10-18-2023
;                         10-20-2023
;                         10-22-2023
;

.586
.MODEL FLAT

INCLUDE io.h			; header file for input/output

.STACK 4096				; set stack size to 4096 bytes

.DATA
prompt1		BYTE		"Enter first score", 0	 ; create prompt for first number
prompt2		BYTE		"Enter second score", 0	 ; create prompt for second number
prompt3		BYTE		"Enter third score", 0	 ; create prompt for third number
prompt4		BYTE		"Enter fourth score", 0	 ; create prompt for fourth number
prompt5		BYTE		"Enter weight 1", 0			 ; create prompt for first weight
prompt6		BYTE		"Enter weight 2", 0			 ; create prompt for second weight
prompt7		BYTE		"Enter weight 3", 0			 ; create prompt for third weight
prompt8		BYTE		"Enter weight 4", 0			 ; create prompt for fourth weight

string		BYTE		40 DUP (?)							 ; create buffer for inputs
resultLbl BYTE    "Result", 0              ; create result label
sumLbl		BYTE		"The weighted sum:", 20h ; create average label
sum			  BYTE		11 DUP (?), 0dh  				 ; create buffer for sum
avgLbl		BYTE		"The average:", 20h 		 ; create average label
avg			  BYTE		11 DUP (?), 0   				 ; create buffer for average
score1	  DWORD		11 DUP (?), 0						 ; create buffer for score1
score2	  DWORD		11 DUP (?), 0						 ; create buffer for score2
score3	  DWORD		11 DUP (?), 0						 ; create buffer for score3
score4	  DWORD		11 DUP (?), 0						 ; create buffer for score4

.CODE
_MainProc PROC
    input   prompt1, string, 40            ; read user input
    atod    string                         ; convert ascii to decimal
    mov     score1, eax                    ; store score from eax

    input   prompt5, string, 40            ; read user input
    atod    string                         ; convert ascii to decimal
    mov     ebx, eax                       ; add eax to total in ebx
    imul    eax, score1                    ; multiply eax by score
    mov     ecx, eax                       ; add eax to ecx

    input   prompt2, string, 40            ; read user input
    atod    string                         ; convert ascii to decimal
    mov     score2, eax                    ; store score from eax

    input   prompt6, string, 40            ; read user input
    atod    string                         ; convert ascii to decimal
    add     ebx, eax                       ; add eax to total in ebx
    imul    eax, score2                    ; multiply eax by score
    add     ecx, eax                       ; add eax to ecx

    input   prompt3, string, 40            ; read user input
    atod    string                         ; convert ascii to decimal
    mov     score3, eax                    ; store score from eax

    input   prompt7, string, 40            ; read user input
    atod    string                         ; convert ascii to decimal
    add     ebx, eax                       ; add eax to total in ebx
    imul    eax, score3                    ; multiply eax by score
    add     ecx, eax                       ; add eax to ecx

    input   prompt4, string, 40            ; read user input
    atod    string                         ; convert ascii to decimal
    mov     score4, eax                    ; 

    input   prompt8, string, 40            ; read user input
    atod    string                         ; convert ascii to decimal
    add     ebx, eax                       ; add eax to total in ebx
    imul    eax, score4                    ; multiply eax by score
    add     ecx, eax                       ; add eax to ecx

    mov     eax, ecx                       ; move ecx value to eax
    sub     edx, edx                       ; clear edx
    idiv    ebx                            ; divide eax by ebx

    dtoa    sum, ecx                       ; convert to ascii
    dtoa    avg, eax                       ; convert to ascii
    output  resultLbl, sumLbl              ; output average and sum

    sub     eax, eax                       ; clear eax
    ret
_MainProc ENDP
END																			   ; end of program
