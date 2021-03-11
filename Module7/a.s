.text
.global _start

_start:
	MOV r3, #7
	ADD r7, r3, #5
	MUL r8, r3, r7
	SUB r8, r8, r3
