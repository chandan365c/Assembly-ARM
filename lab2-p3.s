.DATA
Array:.WORD 1,2,3,4,-1,5,-2,-3,6,0
negsum:.WORD
	
.TEXT
LDR R0, =Array
LDR R2, =negsum
MOV R4, #0
MOV R3, #0
	
Loop:
LDR R1, [R0], #4
CMP R1, #0
ADDLT R3,R3,R1
ADD R4, R4, #1
CMP R4, #10
BNE Loop
B end
	
end:
STR R3,[R2]
SWI 0x011