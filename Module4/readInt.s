.text
.global main

main:
sub sp, sp, #4
str lr, [sp, #0]

#Printf
ldr r0, =prompt
bl printf

#Scanf
ldr r0, =input
ldr r1, =num
bl scanf

#Printf
ldr r0, =output
ldr r1, =num
ldr r1, [r1, #0]
ldr r2, =name
bl printf

mov r0, #0
ldr lr, [sp, #0]
add sp, sp, #4
mov pc, lr

.data
prompt: .asciz "Hello, what is your age?  "
output: .asciz "\nYou are %d years old. %s is smaller than that. \n"
input: .asciz "%d"
num: .word 0
name: .asciz "\n Minh \n"
