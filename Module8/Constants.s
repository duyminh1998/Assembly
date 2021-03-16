.text
.global F2C
.global Ft2Inches

F2C:
	# push
	SUB sp, sp, #4
	STR lr, [sp, #0]

	# pop
	LDR lr, [sp, #0]
	MOV r0, #0
	ADD sp, sp, #4
	MOV pc, lr

Ft2Inches:

.data
