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
    ldr r0, [r0, #0]
    ldr r2, =inches
    ldr r2, [r2, #0]
    mul r4, r0, r2
    ldr r0, =num2
    ldr r0, [r0, #0]
    add r1, r0, r4

# Printing The Message
    ldr r0, =format1
    bl  printf

# End the program by returning to OS
    ldr lr, [sp, #0]
    add sp, sp, #4
    mov pc, lr

.data
num1: .word 0
num2: .word 0
inches: .word 12
format1: .asciz "The number in inches is %d\n"
prompt1:
    .asciz "Enter A value for ft: \n"
prompt2:
    .asciz "Enter A value for inches: \n"

input: .asciz "%d"
readInt: .asciz "%d"
