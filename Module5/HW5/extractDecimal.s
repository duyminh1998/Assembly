#Scanf
.text
.global main

main:
	# save return to os on stack
	SUB sp, sp, #4
	STR lr, [sp, #0]

	# prompt and read input for in value
	LDR r0, =prompt2
	BL  printf
	LDR r0, =readInt
	LDR r1, =in
	BL scanf

	# convert in to ft by dividing the given inches by 12
	LDR r0, =in
	LDR r0, [r0, #0]
	LDR r1, =0b11111111111111111111111000000000
	AND r1, r0, r1
	LDR r2, =num2
	STR r1, [r2, #0]
	LDR r1, =num2
	VLDR s0, [r1, #0]
	VCVT.F64.F32 d4, s0
	VMOV r1, r2, d4

	# printing The Message
	LDR r0, =format1
	BL printf

	# end the program by returning to os
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.data
in: .float 0
num2: .float 0
inchesConstant: .word 12
format1: .asciz "The number in inches is %f\n"
prompt2:
    .asciz "Enter a value for inches: \n"
input: .asciz "%d"
readInt: .asciz "%f"
