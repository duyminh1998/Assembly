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

	# we first compute 5 x (F - 32)
	LDR r0, =num1
	LDR r0, [r0, #0]
	MOV r1, #32
	SUB r3, r0, r1
	MOV r2, #5
	MUL r0, r3, r2

	# finally, divide by 9
	MOV r1, #9
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
	prompt: .asciz "Please enter a temperature in degrees F: "
	input: .asciz "%d"
	output: .asciz "\n Your temperature in degrees C is %d \n"
