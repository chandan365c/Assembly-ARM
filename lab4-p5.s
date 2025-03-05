.DATA
NUM: .word 0x78415374
SMALL: .word

.TEXT
LDR R0, =NUM
LDR R0, [R0]
AND R2, R0, #0xf
MOV R0, R0, LSR #4
CMP R0, #0
BNE loop
BEQ end

loop:
AND R1, R0, #0xf
MOV R0, R0, LSR #4
CMP R1, R2
MOVLT R2, R1
CMP R0, #0x0
BNE loop

end:
LDR R3, =SMALL
STR R2, [R3]
SWI 0x11