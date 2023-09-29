;Author:                  Derek Martinez
;Assignment Title:        Midterm 1 Practicum -- Football Field
;Assignment Description:  create a program that gets the length and width
;                         and calculates the perimeter of the field
;
;
;Due Date:                9-30-2023
;Date Created:            9-29-2023
;Date Last Modified:      9-29-2023

.586
.MODEL FLAT

INCLUDE io.h            ; Include the header file for input/output

.STACK 4096             ; Set the size to 4096 bytes

.DATA
prompt1 BYTE    "Enter length", 0        ; Define a string for the length
prompt2 BYTE    "Enter width", 0         ; Define a string for the width
prompt3 BYTE    "Enter endzones", 0      ; Define a string for endzones
string  BYTE    40 DUP (?)               ; Define a buffer to store input
resultLbl BYTE  "The perimeter is", 0    ; Define a label for the sum message
sum     BYTE    11 DUP (?), 0            ; Define a buffer to store the sum

.CODE
_MainProc PROC
        input   prompt1, string, 40      ; Read user input for the first number
        atow    string                   ; Convert the input to an integer and store
        mov     ebx, eax                 ; Copy the value from EAX to EBX
        add     ebx, ebx                 ; Double the value in ebx

        input   prompt2, string, 40      ; Read user input for the second number
        atow    string                   ; Convert the input to an integer and store
        add     eax, eax                 ; Double the value in eax

        input   prompt3, string, 40      ; Read user input for third number
        atow    string                   ; Convert the input to an integer and store
        add     eax, ebx                 ; Add ebx to eax

        wtoa    sum, eax                 ; Convert the result in EAX to ASCII and store
        output  resultLbl, sum           ; Display the sum

        sub     eax, eax                 ; subtract eax from eax to get 0
        ret                              ; return from program
_MainProc ENDP
END                                      ; End of the program