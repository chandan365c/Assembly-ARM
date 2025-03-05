.DATA

matrix: .word 1, 2, 3 	;Original 3x3 matrix
	.word 4, 5, 6
	.word 7, 8, 9

transpose: .word 0, 0, 0 	;Space for transposed matrix
	   .word 0, 0, 0
	   .word 0, 0, 0


.TEXT
	LDR R0, =matrix
	LDR R1, =transpose
	MOV R3, R1	;Row
	MOV R4, #0  	;Col-iter
	MOV R5, #0 	;Row-iter
	
	loop:
	LDR R2, [R0]
	CMP R4, #9	;Check if we reached 3x3
	BEQ end
	
	CMP R5, #3	;Check if we reached end of the column
	BEQ nextCol
	
	STR R2, [R1], #12
	LDR R0, [R0], #4
	ADD R4, R4, #1	;Iteration counter
	ADD R5, R5, #1	;Row counter
	B loop
	
	nextCol:
	MOV R5, #0	;Reset Row counter
	LDR R3, [R3], #4	;Move to the next column
	MOV R6, R3
	MOV R1, R6
	B loop
	
	end:
	SWI 0x11