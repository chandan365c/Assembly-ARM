.DATA
A: .WORD
	
.TEXT
LDR R1, =A
MOV R2, #10
MOV R3, #1
MOV R4, #0
MOV R5, #0
	
loop:
CMP R2, #0
BEQ end
STR R5, [R1], #4
ADD R5, R3, R4
MOV R3, R4
MOV R4, R5
SUB R2, R2, #1
B loop
	
end:
SWI 0x011