MOV R1, #2
AND R2, R1, #1
CMP R2, #0
BEQ loc1
B loc2
	
loc1:
	LDR R0, =0x00
	SWI 0x011
		
loc2:
	LDR R0, =0xff
	SWI 0x011