	.DATA
	EXP: .ASCIZ "79+42*-"
	plus: .ASCIZ "+"
	minus: .ASCIZ "-"
	mult: .ASCIZ "*"
	
	.TEXT
	LDR R0, =EXP
	LDR R5, =plus
	LDRB R5, [R5]
	LDR R6, =minus
	LDRB R6, [R6]
	LDR R7, =mult
	LDRB R7, [R7]
	SUB R13, R13, #12
	
	loop:
	LDRB R1, [R0], #1
	CMP R1, #0
	BEQ end
	CMP R1, R5
	BEQ add
	CMP R1, R6
	BEQ subtract
	CMP R1, R7
	BEQ mul
	SUB R1, R1, #'0'
	STMDB R13!, {R1}
	B loop
	
	add:
	LDMIA R13!, {R2, R3}
	ADD R4, R2, R3
	STMDB R13!, {R4}
	B loop
	
	subtract:
	LDMIA R13!, {R2, R3}
	SUB R4, R3, R2
	STMDB R13!, {R4}
	B loop
	
	mul:
	LDMIA R13!, {R2, R3}
	MUL R4, R2, R3
	STMDB R13!, {R4}
	B loop
	
	
	end:
	LDMIA R13!, {R0}
	ADD R13, R13, #12
	STR R0, [R1]
	SWI 0x11