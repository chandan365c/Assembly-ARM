.DATA
A: .word 10
B: .word 3

.TEXT
	
LDR R0, =A
LDR R0, [R0]
LDR R1, =B
LDR R1, [R1]
	
loop:
SUB R0, R0, R1
CMP R0, R1
BEQ end
BLT end
BGT loop
	
end:
MOV R2, R0
SWI 0x011