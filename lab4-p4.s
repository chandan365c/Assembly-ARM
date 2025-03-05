.DATA
matrix: .word 7,3,5,1
	.word 4,6,2,8

M: .word 2
N: .word 4
ROW: .word 2

.TEXT
LDR R0, =matrix
LDR R1, =M
LDR R1, [R1]
LDR R2, =N
LDR R2, [R2]
LDR R3, =ROW
LDR R3, [R3]
CMP R3, R1
BLE valid
BGT end

valid:
SUB R3, R3, #1
MOV R6, #0
MOV R5, #0
MUL R4, R3, R2

loop:
ADD R8, R4, R5
LDR R7, [R0, R8, LSL #2]
ADD R6, R6, R7
ADD R5, R5, #1
CMP R5, R2
BLT loop

end:
SWI 0x11