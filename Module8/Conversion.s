.text
.global F2C
.global Ft2Inches

F2C:
	# push
	SUB sp, sp, #4
	STR lr, [sp, #0]

	SUB r0, r0, #32
	MOV r1, #5
	MUL r0, r0, r1
	MOV r1, #9
	BL __aeabi_idiv

	# pop
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

Ft2Inches:
	SUB sp, sp, #4
	STR lr, [sp, #0]

	MOV r1, #12
	MUL r0, r0, r1

	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.data
