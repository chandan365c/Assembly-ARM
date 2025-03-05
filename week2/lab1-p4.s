LDR R0, =0x06
LDR R1, =0x05
CMP R0,R1
BEQ loc1
B loc2
	
loc1:
	SUB R2, R0, R1
	SWI 0x11
		
loc2:
	ADD R2, R0, R1
	SWI 0x11