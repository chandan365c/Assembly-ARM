.DATA
A: .WORD 1,2,3,4,-1,5,-2,-3,6,0
POS: .word 0,0,0,0,0,0,0,0,0,0
NEG: .word 0,0,0,0,0,0,0,0,0,0

.TEXT
LDR R0, =A
LDR R2, =POS
LDR R3, =NEG
MOV R4, #0
	
Loop:
LDR R1, [R0], #4
CMP R1, #0
STRGT R1, [R2], #4
STRLT R1, [R3], #4
STREQ R1, [R2], #4
ADD R4,R4,#1
CMP R4, #10
BNE Loop
B end
	
end:
SWI 0x011