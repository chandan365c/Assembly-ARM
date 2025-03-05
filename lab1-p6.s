MOV R0, #5
MOV R1, #1
	
loop:
	CMP R0, #1
	BEQ end
	MUL R1, R0, R1
	SUB R0, R0, #1
	B loop
	
end:
	SWI 0x11