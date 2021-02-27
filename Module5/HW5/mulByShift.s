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

	# multiplying by 10 is adding a 3 shift and a one shift
	LDR r1, =num1
	LDR r1, [r1, #0]
	LSL r2, r1, #1
	LSL r3, r1, #3
	ADD r1, r2, r3

	# print the result
	LDR r0, =output
	BL printf

	MOV r0, #0
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr
.data
	prompt: .asciz "Please enter a number to multiply by 10: "
	input: .asciz "%d"
	num1: .word 0
	output: .asciz "Ten times your number is %d \n"
