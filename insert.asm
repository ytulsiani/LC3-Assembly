;;===============================
;;Name: Yash Tulsiani
;;===============================

;; variable list
; R0: Location of Array (ARRAY)
; R1: Counter that counts till end of array (k)
; R2: Length of array (LENGTH)
; R3: Array item (current) (Array[k])
; R4: Copy of counter (j)
; R5: Array item (prior) (Array[j-1])
; R6: Dummy Variable
; R7: N/A

.orig x3000
LD R0, ARRAY            ; puts ARRAY in R0
AND R1, R1, 0               ; Sets k to 0
ADD R1, R1, 1               ; Sets k to 1
LD R2, LENGTH           ; Sets LENGTH to R2
FORLOOP AND R6, R6, 0       ; Reset R6
ADD R6, R0, R1              ; Gets ARRAY item location
LDR R3, R6, 0               ; Gets ARRAY item array[k] = curr
AND R4, R4, 0
ADD R4, R4, R1              ; sets j = k
BRnz ENDWHILELOOP
WHILELOOP AND R6, R6, 0               ; reset R6
ADD R6, R0, R4              ; Gets ARRAY item - 1 location 
LDR R5, R6, 0              ; Gets ARRAY item - 1 array[j - 1]
AND R6, R6, 0               ; reset R6
NOT R6, R3                  ; set to -curr - 1
ADD R6, R6, 1               ; -curr
ADD R6, R6, R5              ; array[j - 1] - curr
BRnz ENDWHILELOOP           ; Do not do while loop if curr >= array[j - 1]
STR R5, R5, 1
ADD R4, R4, -1              ; Decrements j
BRp WHILELOOP
ENDWHILELOOP STR R3, R5, 1
ADD R1, R1, 1
NOT R6, R1
ADD R6, R6, 1
ADD R6, R6, R2
BRp FORLOOP
HALT


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

