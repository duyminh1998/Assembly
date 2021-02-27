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
	LDR r0, [r0, #0]
	MOV r1, #45
	MUL r4, r0, r1 
	VLDR s1, [r4]
	MOV r0, #25
	VLDR s0, [r0]
	VDIV.F32 s2, s1, s0

	# Add 32
	#MOV r1, #32
	#VLDR s1, [r1, #0]
	#VADD.F32 s2, s2, s1

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
