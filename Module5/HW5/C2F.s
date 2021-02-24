.text
.global main

main:
	SUB sp, sp, #4
	STR lr, [sp, #0]

	# Prompt for value
	LDR r0, =prompt
	BL printf

	# Read in value
	LDR r0, =input
	LDR r1, =num1
	BL scanf

	# Perform addition
	LDR r1, =num1
	LDR r1, [r1, #0]
	ADD r1, r1, #5

	# Print the result
	LDR r0, =output
	BL printf

	MOV r0, #0
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr
.data
	prompt: .asciz "Please enter a number to add to 5: "
	input: .asciz "%d"
	num1: .word 0
	output: .asciz "\n Your number plus 5 is %d \n"
