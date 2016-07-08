;;===============================
;;Name: Yash Tulsiani
;;===============================

.orig x3000

	LD R6, STACK			; load the stack pointer

	LD R0, N				; R0 = N
	ADD R6, R6, -1			; push argument N on stack
	STR R0, R6, 0			

	JSR TWOTORIAL

	LDR R0, R6, 0			; load return value off top of stack
	ADD R6, R6, 2 			; restore stack to previous value

	ST R0, ANSWER			; store answer
	HALT

N 		.fill 9
ANSWER 	.blkw 1
STACK 	.fill xF000


TWOTORIAL

    ; Initialize stack
    LD R6, STACK

    ; Call digisum(n)
    LD R0, N
    ADD R6, R6, -1
    LDR R2, R5, 4       ; load N                  
    STR R0, R6, 0
    JSR DIGISUM

    ; Pop return value and arg off stack
    ;LDR R0, R6, 0
    ADD R6, R6, 2

    ; Save the answer
    ST R0, ANSWER

    HALT

DIGISUM

    ADD R6, R6, -3      ; move up stack 3 spots   \
    STR R7, R6, 1       ; store Return Address    | Construct stack frame
    STR R5, R6, 0       ; store Old Frame Pointer |
    ADD R5, R6, -1      ; set new Frame Pointer   /
    
    ADD R6, R6, 0      ; allocate space for 2 locals
    
    LDR R0, R5, 4       ; load N, first argument  \
 

    BRp ELSE           ; if N != 0, goto ELSE    / if (n == 0) {    
    AND R0, R0, 0   ; R0 = 0
    AND R2, R2, 0   ; R2 = 0                      \
    STR R2, R5, 3   ; store 0 as return value     |     return 0;
    BR RETURN       ; go to return part           / } else {
    
ELSE

    ADD R6, R6, -1      ; allocate stack space for argument      \
    ADD R0, R0, -2
    STR R0, R6, 0       ; push div onto the stack                | R0 = digisum(div)
    JSR DIGISUM         ;                                        |
    ADD R6, R6, 2       ; pop answer and digisum param off stack /
    	
    ADD R1, R5, 4       ; mod + digisum(div)      |     return mod + digisum(div);
    LDR R1, R1, 0       ; loads currenct value
    ADD R0, R0, R1      ; adds previous value to current
    STR R0, R5, 3       ; store return value      / }

RETURN

    ADD R6, R5, 4       ; R6 (stack pointer) now points to RV \
    LDR R7, R5, 2       ; restore R7 (return address)         | Deconstruct stack frame
    LDR R5, R5, 1       ; restore R5 (old frame pointer)      |
    RET                 ; return                              /
.end
