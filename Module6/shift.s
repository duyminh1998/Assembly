# Template.s
# A template for assmebly program using gcc
    .text
    .global main

main:
# Save return to os on stack
    sub sp, sp, #4
    str lr, [sp, #0]

#mvn r0, #0b1001, 20
#mvn r0, #0b100010
#mov r0, #0b1001, 16
#mvn r0, #0b01001010
#mov r0, #-260
mvn r0, #0b01000010, 30
ldr r2, =num1
str r0, [r2]
ldr r1, =num1
ldr r1, [r1]
ldr r0, =output
bl printf

# Return to the OS
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr

.data
num1: .word 0
output: .asciz "%d"
