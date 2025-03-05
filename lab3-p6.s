LDR R0, =0x00000788
MOV R2, #0
	
loop:
AND R1, R0, #0xF
ADD R2, R2, R1
MOV R0, R0, LSR #4
CMP R0, #0
BEQ end
B loop
	
end:
SWI  0x011