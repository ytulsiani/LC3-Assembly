;;===============================
;;Name: Yash Tulsiani
;;===============================

.orig x3000

	LD R6, STACK			; load the stack pointer

	LD R0, N			    ; R0 = ARRAY1, change later to ARRAY2 and ARRAY3 for testing
	ADD R6, R6, -1 			; allocate spot on stack
	STR R0, R6, 0			; push argument ARRAY on stack

	JSR POWERSOF2

	LDR R0, R6, 0			; load return value off top of stack
	ADD R6, R6, 3 			; restore stack to previous value

	ST R0, ANSWER			; store answer
	HALT




N 		.fill 5
ANSWER 	.blkw 1
STACK 	.fill xF000


POWERSOF2


    ADD R6, R6, -3      ; move up stack 3 spots   \
    STR R7, R6, 1       ; store Return Address    | Construct stack frame
    STR R5, R6, 0       ; store Old Frame Pointer |
    ADD R5, R6, -1      ; set new Frame Pointer   /
    
    ADD R6, R6, -2      ; allocate space for 2 local variables
    
    LDR R0, R5, 4       ; load N  \
    BRz ELSEZERO        ; Branch to ELSE if array item is 0
    ADD R0, R0, -1      ; Subtract by 1 to see if value is 1
    BRz ELSEONE         ; If value is 1, branch to ELSEONE
    ADD R0, R0, 1       ; Goes back to original value
    
    ADD R6, R6, -1
    ADD R0, R0, -1
    STR R0, R6, 0
    JSR POWERSOF2
    LDR R0, R5, 4       ; load N
    ADD R6, R6, -1
    ADD R0, R0, -2
    STR R0, R6, 0
    JSR POWERSOF2
    LDR R2, R6, 0
    STR R2, R5, 0       ; first local
    STR R3, R5, -1      ; second local
    ADD R6, R6, 2
    
    AND R4, R4, 0
    AND R1, R1, 0
    ADD R4, R4, 3
LOOP
    ADD R1, R1, R2
    ADD R4, R4, -1
    BRp LOOP
    
    AND R4, R4, 0
    AND R0, R0, 0
    AND R4, R4, 2
LOOPOTHER
    ADD R0, R0, R3
    ADD R4, R4, -1
    BRp LOOPOTHER

    NOT R0, R0
    ADD R0, R0, 1
    ADD R0, R0, R1


    STR R0, R5, 3   ; store 1 + arrayhop as return value     |     return 0;
    BR RETURN       ; go to return part           / } else {

ELSEZERO
    AND R1, R1, 0   ; clears register R1
    ADD R1, R1, 1
    STR R1, R5, 3    ; stores 0 to return value in stack
    BR RETURN

ELSEONE
    AND R1, R1, 0
    ADD R1, R1, 2
    STR R1, R5, 3
    
RETURN

    ADD R6, R5, 3       ; R6 (stack pointer) now points to RV \
    LDR R7, R5, 2       ; restore R7 (return address)         | Deconstruct stack frame
    LDR R5, R5, 1       ; restore R5 (old frame pointer)      |
    RET                 ; return                              /


.end
