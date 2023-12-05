// Author:									Derek Martinez
// Assignment Title : P9_2  Even Parity
// Assignment Description : count number of 1 bits in a string
// 						if it is odd set parity bit-7 to one
//
// Due Date : 12 - 01 - 2023
// Date Created : 11 - 30 - 2023
// Date Last Modified : 11 - 30 - 2023
//

.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output

.STACK 4096

.DATA
prompt db "Enter a string: ", 0
msg_before db "Before: ", 0
msg_after db "After: ", 0
newline db 0xA, 0xD, 0

.CODE
_MainProc PROC
        ; Display prompt and read input string from user
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, prompt
    mov edx, 14         ; prompt length
    int 0x80            ; invoke syscall

    mov eax, 3          ; sys_read
    mov ebx, 0          ; stdin
    mov ecx, input_str
    mov edx, 256        ; maximum bytes to read
    int 0x80            ; invoke syscall

    ; Display original input string
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_before
    mov edx, 8
    int 0x80

    mov esi, input_str  ; esi points to the input string

    ; Call assembly function to modify string for even parity
    call parity_fix

    ; Display modified string
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_after
    mov edx, 7
    int 0x80

    ; Display modified string
    mov eax, 4
    mov ebx, 1
    mov ecx, input_str
    mov edx, 256
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

parity_fix:
    push ebp            ; Establish stack frame
    mov ebp, esp

    xor ecx, ecx        ; Clear count register

loop_start:
    mov al, [esi + ecx]    ; Load a character from input string
    test al, 0x80      ; Check if high-order bit is set
    jz parity_ok       ; Jump if already even parity
    
    xor al, 0x80       ; Flip high-order bit for even parity
    mov [esi + ecx], al    ; Update character in string

parity_ok:
    inc ecx            ; Move to next character
    cmp byte [esi + ecx], 0    ; Check for null terminator
    jnz loop_start     ; If not end of string, continue loop

    pop ebp            ; Restore stack frame
    ret                ; Return from function
_MainProc ENDP
END                             ; end of source code

