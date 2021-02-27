.text
.global main

main:
	SUB sp, sp, #4
	STR lr, [sp, #0]

	# prompt for value
	LDR r0, =prompt
	BL printf

	# read in value
	LDR r0, =input
	LDR r1, =num1
	BL scanf

	# we compute C*(9/5) as (C*9*5)/25
	LDR r0, =num1
	MOV r1, #2
	VLDR s0, [r0]
	VLDR s1, [r1]
	VMUL.F32 s2, s0, s1

	# Print the result
	LDR r0, =output
	VCVT.F64.F32 d4, s2
	VMOV r1, r2, d4
	BL printf

	MOV r0, #0
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr
.data
	num1: .word 0
	prompt: .asciz "Please enter a temperature in degrees C: "
	input: .asciz "%d"
	output: .asciz "\n Your temperature in degrees F is %f \n"
