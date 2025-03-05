.DATA
A: .hword 1,2,3,4,5,6,7,8,9
FOUND: .word 0
	
.TEXT
MOV R0, #10
MOV R1, #0
LDR R2, =A
LDRH R3, [R2]
	
loop:
LDRH R3, [R2]
CMP R3, R0
BEQ end
ADD R2, R2, #2
ADD R1, R1, #1
CMP R1, #10
BEQ notfound
B loop

notfound:
SWI 0x011
	
end:
MOV R6, #1
LDR R7, =FOUND
STR R6, [R7]
SWI 0x011