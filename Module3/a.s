.text
.global main

# Print Message
main:
SUB r13, r13, # 4
STR r14, [r13, #0]

LDR r0, =hw
BL printf

LDR r14, [r13, #0]
ADD sp, sp, # 4
MOV r15, r14

.data
hw: .asciz "Hello World\n"
