.DATA
A: .word 1,2,3,4
B: .word 5,6,7,8
	
.TEXT
LDR R0, =A
LDR R1, =B
MOV R2, #4
	
loop:
LDR R3, [R0], #4
LDR R4, [R1], #4
MLA R6, R3, R4, R6
SUB R2, R2, #1
CMP R2, #0
BEQ end
B loop
	
end:
SWI  0x011