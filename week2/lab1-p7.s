LDR R0, =0x31
LDR R1, =0x0E
	
loop:
	CMP R0, R1
	BEQ end
	BGT greater
	SUB R1, R1, R0
	B loop
		
greater:
	SUB R0, R0, R1
	B loop
	
end:
	SWI 0x11