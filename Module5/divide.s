#Scanf
.text
.global main

main:
# Save return to os on stack
    sub sp, sp, #4
    str lr, [sp, #0]

# Prompt and read integer input
    ldr r0, =prompt1
    bl  printf
    ldr r0, =readInt
    ldr r1, =num1
    bl  scanf 
    
# Prompt and read integer input
    ldr r0, =prompt2
    bl  printf
    ldr r0, =readInt
    ldr r1, =num2
    bl  scanf 

# Get the two values divide them, storing the
# result in r0
    ldr r0, =num1
    vldr s0,[r0, #0]
    ldr r1,=num2
    vldr s1,[r1, #0]
    # vldr s0, [r0]
    # vldr s1, [r1]
    vdiv.F32 s2, s0, s1 

# Printing The Message
    # vldr s0, [r0]
    vcvt.F64.F32 d4, s2
    vmov r1, r2, d4
    ldr r0, =format1
    bl  printf

# End the program by returning to OS
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr

.data
num1: .word 0
num2: .word 0
format1: .asciz "The number is %f\n"
prompt1:
    .asciz "Enter A value for x: \n"
prompt2:
    .asciz "Enter A value for y: \n"

input: .asciz "%d"
readInt: .asciz "%d"
