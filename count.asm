;;===============================
;;Name: Yash Tulsiani
;;===============================

.orig x3000
LD R0, 0                      ; Sets the register R0 = ANSWER
AND R0, R0, 0                 ; Sets R0 to 0
LD R2, 0
LD R3, ARRAY                  ; Sets R3 as ARRAY
LD R1, LENGTH                 ; Sets R1 as LENGTH
LOOP BRnz RETURN              ; Checks if R1 (Length) is negative or zero. Branches to RETURN if true 
AND R2, R2, 0                 ; Sets R2 to 0
LDR R2, R3, 0                 ; Sets R2 to the current array pointer
BRn COUNTER                   ; If the value at the counter is negative, branches to COUNTER
BRzp COUNTEROTHER

COUNTER ADD R0, R0, 1         ; Increments the counter by 1
ADD R3, R3, +1                ; Increases array pointer by 1
ADD R1, R1, -1                ; Decrements the length of the array by 1
BRp LOOP                      ; Loops to the beggining of the loop 
BRnz RETURN

COUNTEROTHER ADD R3, R3, +1
ADD R1, R1, -1
BRp LOOP

RETURN ST R0, ANSWER

HALT

 
	
ARRAY   .fill x6000
LENGTH  .fill 10
ANSWER	.fill 0		; The answer should have the number of negative values when finished.
.end

.orig x6000
.fill -20
.fill 14
.fill 7
.fill 0
.fill -3
.fill 11
.fill 9
.fill -9
.fill 2
.fill -5
.end
