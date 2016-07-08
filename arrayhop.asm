;;===============================
;;Name: Yash Tulsiani
;;===============================

.orig x3000

	LD R6, STACK			; load the stack pointer

	AND R0, R0, 0
	ADD R6, R6, -1			; push argument idx=0 on stack
	STR R0, R6, 0 

	LD R0, ARRAY3			; R0 = ARRAY1, change later to ARRAY2 and ARRAY3 for testing
	ADD R6, R6, -1 			; allocate spot on stack
	STR R0, R6, 0			; push argument ARRAY on stack

	JSR ARRAYHOP

	LDR R0, R6, 0			; load return value off top of stack
	ADD R6, R6, 3 			; restore stack to previous value

	ST R0, ANSWER			; store answer
	HALT

ARRAY1 	.fill x5000
ARRAY2	.fill x5010
ARRAY3  .fill x5020
ANSWER 	.blkw 1
STACK 	.fill xF000


ARRAYHOP


    ADD R6, R6, -3      ; move up stack 3 spots   \
    STR R7, R6, 1       ; store Return Address    | Construct stack frame
    STR R5, R6, 0       ; store Old Frame Pointer |
    ADD R5, R6, -1      ; set new Frame Pointer   /
    
    ADD R6, R6, -1      ; allocate space for 1 local
    
    LDR R0, R5, 4       ; load ARRAY, first argument  \
    LDR R1, R5, 5       ; load INDEX, second argument
    LDR R2, R5, 4       ; load ARRAY
    ADD R2, R2, R1      ; loads ARRAY item address at index
    LDR R2, R2, 0       ; loads ARRAY item at Index
    BRz ELSE            ; Branch to ELSE if array item is 0

    AND R3, R3, 0
    ADD R3, R1, R2      ; Index + N = R3
    ADD R6, R6, -1      ; push argument idx=0 on stack
    STR R3, R6, 1       ; Stores new index in stack
    STR R0, R6, 0       ; 
    JSR ARRAYHOP
    
    LDR R0, R6, 0
    AND R2, R2, 0
    ADD R2, R2, 1
    ADD R2, R2, R0
    ADD R6, R6, 3





    STR R2, R5, 3   ; store 1 + arrayhop as return value     |     return 0;
    BR RETURN       ; go to return part           / } else {

ELSE
    AND R1, R1, 0   ; clears register R1
    STR R1, R5, 3    ; stores 0 to return value in stack
    
RETURN

    ADD R6, R5, 3       ; R6 (stack pointer) now points to RV \
    LDR R7, R5, 2       ; restore R7 (return address)         | Deconstruct stack frame
    LDR R5, R5, 1       ; restore R5 (old frame pointer)      |
    RET                 ; return                              /

.end

; 4 hops
.orig x5000
.fill 2
.fill 1
.fill 3
.fill 0
.fill -1
.fill -1
.end

; 5 hops
.orig x5010
.fill 1
.fill 1
.fill 1
.fill 3
.fill 0
.fill -12
.fill -2
.end

; 12 hops
.orig x5020
.fill 5
.fill 1
.fill 0
.fill -3
.fill 10
.fill -1
.fill 5
.fill 20
.fill 2
.fill 3
.fill 1
.fill -2
.fill 9
.fill 14
.fill 3
.fill 20
.fill -2
.fill -7
.fill 5
.fill 1
.fill -18
.fill -2
.end
