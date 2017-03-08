	.extern _stack
	.global start
	.equ N, 4

	.data
A:	.word 5, 21, 33, 14, 56

start:
	ldr sp, =_stack
	mov fp, #0
	ldr r0, =A
	mov r1, #N
	bl Mayor
	B .


Mayor:
	push {r4, r5, fp}
	add fp, sp, #8
	mov r5, #0 // max
	mov r3, #0 // ind
	mov r4, #-1 // i

	for:
		add r4, r4, #1
		cmp r4, r1
		bge fin

	// IF
		ldr r2, [r0, r3, LSL#2]
		cmp r2, r5 // A[i], max
		ble for
		mov r5, r2
		mov r3, r4
		b for

fin:	pop {r4, r5, fp}
		mov r0, r3
		mov pc, lr

	.end

