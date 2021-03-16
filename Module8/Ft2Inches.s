#Scanf
.text
.global main

main:
	# save return to os on stack
	SUB sp, sp, #4
	STR lr, [sp, #0]

	# prompt and read input for ft value
	LDR r0, =prompt1
	BL  printf
	LDR r0, =readInt
	LDR r1, =ft
	BL scanf

	# prompt and read input for in value
	LDR r0, =prompt2
	BL printf
	LDR r0, =readInt
	LDR r1, =in
	BL scanf

	# convert ft to in by multiplying each ft by 12 inches
	LDR r0, =ft
	LDR r0, [r0, #0]
	BL Ft2Inches
	MOV r1, r0

	# printing The Message
	LDR r0, =format1
	BL printf

	# end the program by returning to os
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.data
ft: .word 0
in: .word 0
inchesConstant: .word 12
format1: .asciz "The number in inches is %d\n"
prompt1:
    .asciz "Enter a value for ft: \n"
prompt2:
    .asciz "Enter a value for inches: \n"
input: .asciz "%d"
readInt: .asciz "%d"
