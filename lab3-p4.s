.data
A: .word 1,2,3
   .word 4,5,6
   .word 7,8,9
.text
ldr R2,=A
mov R3,#3
mov R1,#2
mov R0,#1
mla R4,R1,R0,R3
mov R5,R4,LSL#2
add r6,r5,r2
swi 0x011