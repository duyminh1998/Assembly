.text
.global main

main:
sub sp, sp, #4
str lr, [sp, #0]

ldr r0, =hw
bl printf

mov r0, #0
ldr lr, [sp, #0]
add sp, sp, #4
mov pc, lr

.data
hw: .asciz "Hello World\n"
