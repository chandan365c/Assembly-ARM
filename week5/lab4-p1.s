	.DATA
	MAT: .WORD 0,0,0,0,0,0,0,0,0
	
	
	.TEXT
	LDR R0, =MAT
	MOV R1, #1 	;Natural number
	MOV R3, R0	;Row
	MOV R5, #0 	;Row-iter
	
	loop:
	CMP R1, #10	;Check if we reached position 3x3
	BEQ end
	
	CMP R5, #3	;Check if we reached end of the column
	BEQ nextCol
	
	STR R1, [R0], #12
	ADD R1, R1, #1	;Natural number adder
	ADD R5, R5, #1	;Row counter
	B loop
	
	nextCol:
	MOV R5, #0		;Reset Row counter
	LDR R3, [R3], #4	;Move to the next column
	MOV R0, R3
	B loop
	
	end:
	SWI 0x11
	