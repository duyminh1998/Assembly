.text
.global main

main:
sub sp, sp, #4
str lr, [sp, #0]

#Printf
ldr r0, =prompt1
bl printf

#Scanf
ldr r0, =input1
ldr r1, =num1
bl scanf

#Printf the first output
ldr r0, =output1
ldr r1, =num1
ldr r1, [r1, #0]
bl printf

#Printf the second output
ldr r0, =output2
bl printf

mov r0, #0
ldr lr, [sp, #0]
add sp, sp, #4
mov pc, lr

.data
prompt1: .asciz "Hello, what is your age?  "
output1: .asciz "You are \t%d\t years old.\n"
output2: .asciz "I am also printing \"\", which are double quotation marks\n"
input1: .asciz "%d"
num1: .word 0
