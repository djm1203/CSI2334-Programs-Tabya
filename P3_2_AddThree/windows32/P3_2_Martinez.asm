;Author:                  Derek Martinez
;Assignment Title:        P3_1 Sum of Three
;Assignment Description:  create a program that gets the sum of three numbers
;
;
;Due Date:                9-26-2023
;Date Created:            9-24-2023
;Date Last Modified:      9-24-2023
;                         9-25-2023 -- finished comments

.586
.MODEL FLAT

INCLUDE io.h            ; Include the header file for input/output

.STACK 4096             ; Set the size to 4096 bytes

.DATA
prompt1 BYTE    "Enter first number", 0  ; Define a string for the first number
prompt2 BYTE    "Enter second number", 0 ; Define a string for the second number
prompt3 BYTE    "Enter third number", 0  ; Define a string for the third number
string  BYTE    40 DUP (?)               ; Define a buffer to store input
resultLbl BYTE  "The sum is", 0          ; Define a label for the sum message
sum     BYTE    11 DUP (?), 0            ; Define a buffer to store the sum

.CODE
_MainProc PROC
        input   prompt1, string, 40      ; Read user input for the first number
        atod    string                   ; Convert the input to an integer and store
        mov     ebx, eax                 ; Copy the value from EAX to EBX

        input   prompt2, string, 40      ; Read user input for the second number
        atod    string                   ; Convert the input to an integer and store
        add     eax, ebx                 ; Add the second number to the first number
        mov     ebx, eax                 ; copy value from eax to ebx
        
        input   prompt3, string, 40      ; Read user input for the third number
        atod    string                   ; Convert the input to an integer and store
        add     eax,ebx                  ; add the third number to eax

        dtoa    sum, eax                 ; Convert the result in EAX to ASCII and store
        output  resultLbl, sum           ; Display the sum

        sub     eax, eax                 ; subtract eax from eax to get 0
        ret                              ; return from program
_MainProc ENDP
END                                      ; End of the program
