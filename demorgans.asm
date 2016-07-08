;;===============================
;;Name: Yash Tulsiani
;;===============================

.orig x3000
LD R0, 0       ; Sets the register R0 (answer) to value 0  (R0 = ANSWER = 0)
LD R1, A       ; Sets the register R1 to the contents of A (R1 = A)
LD R2, B       ; Sets the register R2 to the contents of B (R2 = B)
NOT R1, R1     ; Sets the register R1 to the not value of A (R3 = !A)
NOT R2, R2     ; Sets the register R2 to the not value of B (R4 = !B)
AND R0, R1, R2 ; Sets the register R0 to the AND of A and B (R0 = A AND B)
NOT R0, R0     ; Sets the register R0 to the not value of R0 (R0 = !R0)
ST R0, ANSWER  ; Stores the final value in answer.
HALT           ; end of commands
	
A       .fill 6
B       .fill 13
ANSWER  .fill 0		; This answer should contain A | B when finished.
.end
