.DATA
num1: .word 123
num2: .word 7
sum: .word

.TEXT
LDR R0, =num1
LDR R0, [R0]
LDR R1, =num2
LDR R1, [R1]
LDR R2, =sum
STMFD R13!, {R0, R1}
BL ADDbcd
STR R5, [R2]
SWI 0x11

ADDbcd:
LDMFD R13!, {R3,R4}
ADD R5, R3, R4
BX LR