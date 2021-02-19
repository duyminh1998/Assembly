.text
.global main

main:
sub sp, sp, #4
str lr, [sp, #0]

#Print the prompt asking for a float input
ldr r0, =prompt1
bl printf

#Scan the user for input
ldr r0, =input1
ldr r1, =num1
bl scanf

#Print the result
# we first load our 32-bit floating point number's address into r1
ldr r1, =num1
# we then move the value in r1 into the vfp register
vldr s0, [r1, #0]
# we convert the 32-bit number to 64-bit for double precision
vcvt.F64.F32 d4, s0
# split the double vfp register into two arm registers
vmov r1, r2, d4
# load the formatted string and link print
ldr r0, =output1
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
