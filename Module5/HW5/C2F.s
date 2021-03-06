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

	# we first compute 5 x C x 9 + 32 x 25
	LDR r0, =num1
	LDR r0, [r0, #0]
	MOV r1, #45
	MUL r4, r0, r1
	MOV r3, #800
	ADD r0, r4, r3

	# finally, divide by 25
	MOV r1, #25
	BL __aeabi_idiv

	# Print the result
	MOV r1, r0
	LDR r0, =output
	BL printf

	MOV r0, #0
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr
.data
	num1: .word 0
	prompt: .asciz "Please enter a temperature in degrees C: "
	input: .asciz "%d"
	output: .asciz "\n Your temperature in degrees F is %d \n"
