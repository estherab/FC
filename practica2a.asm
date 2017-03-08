.global start

.EQU N, 8

.data
A:		.word 7, 3, 25, 4, 75, 2, 1, 1

.bss
B:		.space N*4
max:	.space 4
ind: 	.space 4

.text
start:
		mov r0, #-1 // j
		mov r1, #-1 // i

		ldr r2, =A
		ldr r4, =B

		ldr r6, =max
		mov r7, #0 // max
		str r7, [r6]

		ldr r8, =ind


forj:
		add r0, r0, #1
		cmp r0, #N
		bge fin

		mov r7, #0
		mov r1, #-1

fori:
		add r1, r1, #1
		cmp r1, #N
		bge guardarB

		ldr r3, [r2, r1, lsl#2] // A[i]
		cmp r3, r7
		ble fori

		mov r7, r3
		str r7, [r6]
		mov r9, r1
		str r9, [r8]

		b fori

guardarB: str r7, [r4, r0, lsl#2]

		  mov r11, #0
		  str r11, [r2, r9, lsl#2]

		  b fori

fin:	b .
		.end
