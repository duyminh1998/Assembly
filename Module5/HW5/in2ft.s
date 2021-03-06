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
	LDR r1, =inchesConstant
	LDR r1, [r1, #0]
	BL __aeabi_idiv

	# in / 12 rounded to nearest integer is now stored in r0
	# we want to extract the remainder 
	LDR r1, =in
	LDR r1, [r1, #0]
	LDR r2, =inchesConstant
	LDR r2, [r2, #0]
	MUL r4, r0, r2
	SUB r1, r1, r4
	MOV r2, r1
	MOV r1, r0

	# printing The Message
	LDR r0, =format1
	BL printf

	# end the program by returning to os
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.data
in: .word 0
inchesConstant: .word 12
format1: .asciz "The number in is %d ft and %d in\n"
prompt2: .asciz "Enter a value for inches: \n"
input: .asciz "%d"
readInt: .asciz "%d"
