# Template.s
# A template for assmebly program using gcc
    .text
    .global main

main:
# Save return to os on stack
    sub sp, sp, #4
    str lr, [sp, #0]

mov r0, #0b011111111, 2
mov r1, #255

# Return to the OS
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr

.data

