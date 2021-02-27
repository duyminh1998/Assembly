.text
.global main

main:
	# save return to os on stack
    	SUB sp, sp, #4
    	STR lr, [sp, #0]

	# we swap the values in r0 and r1, so that we only print r1's value now
	# stored in r0
    	MOV r0, #0
    	MOV r1, #1
    	EOR r2, r0, r1

	# r2 now contains both r0 and r1
	# retrieve r1 into r0
    	EOR r0, r2, r0
	EOR r1, r2, r1

	# return to the OS
    	LDR lr, [sp, #0]
    	ADD sp, sp, #4
    	MOV pc, lr

.data

