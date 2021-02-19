.text
.global main

main:
sub sp, sp, #4
str lr, [sp, #0]

#Print out the prompt asking for a user's age
ldr r0, =prompt1
bl printf

#Scan the user's input
ldr r0, =input1
ldr r1, =num1
bl scanf

#Print out the result 
ldr r0, =output1
ldr r1, =num1
ldr r1, [r1, #0]
bl printf

mov r0, #0
ldr lr, [sp, #0]
add sp, sp, #4
mov pc, lr

.data
prompt1: .asciz "Hello, what is your age?  "
output1: .asciz "You are \t%d\t years old.\n"
input1: .asciz "%d"
num1: .word 0
