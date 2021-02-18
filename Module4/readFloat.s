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

#Printf
ldr r1, =num1
vldr s0, [r1]
vcvt.F64.F32 d4, s0
ldr r0, =output1
vmov r1, r2, d4
bl printf

mov r0, #0
ldr lr, [sp, #0]
add sp, sp, #4
mov pc, lr

.data
num1: .float 0
prompt1: .asciz "Enter a floating point number: "
output1: .asciz "Your floating point number is %f \n"
input1: .asciz "%f"
