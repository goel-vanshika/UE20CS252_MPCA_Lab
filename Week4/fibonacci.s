.DATA 
A: .WORD

.TEXT
LDR R6, =A
MOV R1, #0
MOV R2, #1
STR R1, [R6], #4
STR R2, [R6], #4
MOV R5, #10
SUB R5, R5, #2
LOOP: 
ADD R0, R2, R1
STR R0, [R6], #4
MOV R1, R2
MOV R2, R0
SUB R5, R5, #1
BNE LOOP 
SWI 0X011
.END