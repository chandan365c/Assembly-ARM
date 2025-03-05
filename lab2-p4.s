.DATA
A: .word 10,50,41,55,30,20,11,5,100,77
	
.TEXT
LDR R0, =A
LDR R1, [R0]
MOV R5, #0
	
Loop:
LDR R2, [R0, #4]!
CMP R1, R2
MOVGT R1, R2
ADD R5, R5, #1
CMP R5, #9
BNE Loop
B end
	
end:
SWI 0x011