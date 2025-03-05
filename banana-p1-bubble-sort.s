	.DATA
	Arr: .WORD 7,6,5,4,3,2,1 ;size = 6
	
	.TEXT
	LDR R0, =Arr
	MOV R1, #6 ;Size
	MOV R2, #0 ;outer i
	
	outer:
	MOV R3, #0 ;inner j
	SUB R4, R1, R2	;size - i (j loop)
		inner:
		ADD R5, R3, #1	;R5 stores j+1
		LDR R6, [R0, R3, LSL #2]	;Store j
		LDR R7, [R0, R5, LSL #2]	;Store j+1
		CMP R6, R7
		BGT swap
		BLT move_next
		
		swap:
		STR R6, [R0, R5, LSL #2]	;Just change what they store
		STR R7, [R0, R3, LSL #2]
		
		move_next:
		ADD R3, R3, #1	;j++
		CMP R3, R4	;check if j < size - i
		BLT inner
		
	ADD R2, R2, #1	;i++
	CMP R2, R1	;check if i < size
	BLT outer
	
	.END
	SWI 0x11