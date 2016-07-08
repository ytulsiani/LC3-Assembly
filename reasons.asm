;;===============================
;;Name: Yash Tulsiani
;;===============================

.orig x3000
LEA R0, START_MSG_1         ; Puts "The " in memory
PUTS                        ; Prints out "The "
LEA R2, GRAMMAR_ARR         ; GRAMMAR_ARR Location
LD R1, N                    ; Puts the value of N in memory

LOOP ADD R1, R1, -1         ; Counts down till n = 0
BRnz PRINTNUMBER
ADD R2, R2, 1               ; GRAMMAR_ARR incremented

BR LOOP                     ; Takes back to beggining of the LOOP

PRINTNUMBER LDR R0, R2, 0
PUTS                        ; Run when we have gram#. Print it.

LEA R0, START_MSG_2         ; Puts " reasons I love CS 2110 so far" in memory
PUTS                        ; Prints it out 

LEA R2, MESSAGE_ARR         ; MESSAGE_ARR Location
LD R1, N                    ; Puts N back in memory

LOOP_OTHER BRp PRINTNUMBER_OTHER
BRnz END_PROG

PRINTNUMBER_OTHER LDR R0, R2, 0
PUTS
ADD R2, R2, 1
ADD R1, R1, -1
BRp LOOP_OTHER

END_PROG HALT





N .fill 10

START_MSG_1
    .stringz "The "

START_MSG_2
    .stringz " reasons I love CS 2110 so far:\n"

GRAMMAR_ARR
    .fill GRAM01
    .fill GRAM02
    .fill GRAM03
    .fill GRAM04
    .fill GRAM05
    .fill GRAM06
    .fill GRAM07
    .fill GRAM08
    .fill GRAM09
    .fill GRAM10

MESSAGE_ARR
    .fill MESS01
    .fill MESS02
    .fill MESS03
    .fill MESS04
    .fill MESS05
    .fill MESS06
    .fill MESS07
    .fill MESS08
    .fill MESS09
    .fill MESS10
.end

.orig x5000
GRAM01
    .stringz "one"
GRAM02
    .stringz "two"
GRAM03
    .stringz "three"
GRAM04
    .stringz "four"
GRAM05
    .stringz "five"
GRAM06
    .stringz "six"
GRAM07
    .stringz "seven"
GRAM08
    .stringz "eight"
GRAM09
    .stringz "nine"
GRAM10
    .stringz "ten"
MESS01
    .stringz "One, I made this cool program in assembly!\n"
MESS02
    .stringz "Two, the TAs are super helpful!\n"
MESS03
    .stringz "Three, Professor Leahy is an entertaining lecturer!\n"
MESS04
    .stringz "Four, I now know how to prevent electrical fires!\n"
MESS05
    .stringz "Five, bitwise operations are really useful!\n"
MESS06
    .stringz "Six, I can make state machines now!\n"
MESS07
    .stringz "Seven, memory is no longer a mystery!\n"
MESS08
    .stringz "Eight, I understand how a basic computer works now!\n"
MESS09
    .stringz "Nine, I feel more confident with binary and hex!\n"
MESS10
    .stringz "Ten, I'm looking forward to learning C!\n"
.end
