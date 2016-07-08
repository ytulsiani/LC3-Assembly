;;===============================
;;Name: Yash
;;===============================

.orig x3000
AND R0,R0,0; Outer Counter = 0
ADD R0,R0,1; Outer Counter = 1
LD R1,LENGTH; Length variable
NOT R1,R1; two's comp of length
ADD R1,R1,#1;
TOP	ADD R6,R0,R1; counter-length
	BRzp ENDOUT; when counter>length, ends
	;OUTER LOOP

	LD R6, ARRAY; load array
	ADD R6, R6, R0; load current array element at k
	LDR R3, R6, 0; load current array value, array[k]

	AND R2,R2,0;clearing R2
	ADD R2,R2,R0; Inner Counter = Outer Counter, j

		TOPI; INNER LOOP HEAD	
		LD R4, ARRAY; load array
		ADD R4, R4, R2; load array[j]
		ADD R4, R4, #-1; load array[j-1]
		LDR R4, R4, 0; load array[j-1]
		NOT R5,R3;2's comp of curr
		ADD R5,R5,#1;
		ADD R5,R5,R4;array[j-1] - curr
		BRnz ENDIN;if array[j-1] < curr, end inner loop
		;INNER LOOP
		STR R4, R6,0;array[j] = array[j-1]

		ADD R6,R6,-1;decrements address
		ADD R2,R2,#-1;decrements j
		BRnz ENDIN; if j <= 0 end inner loop
		BR TOPI;
		;INNER LOOP
		ENDIN
		LD R4,ARRAY;
		ADD R4,R4,R2;
		STR R3,R4,0;

	
	;OUTER LOOP
	ADD R0,R0,#1; increment
	BR TOP; go back to beginning of loop
	ENDOUT
;; CODE GOES HERE! grin emoticon

ARRAY   .fill x6000
LENGTH  .fill 12
.end

.orig x6000
.fill 27
.fill 5
.fill -18
.fill 165
.fill -101
.fill 10
.fill 34
.fill 0
.fill -7
.fill 88
.fill 9
.fill 212
.end
