.global start

.EQU N, 8

.data
A:		.word 7, 3, 25, 4, 75, 2, 1, 1

.bss
max:	.space 4

.text
start:
		ldr r1, =max
		mov r0, #0 // r0 = i
		str r0, [r1] // Inicializo max
		ldr r2, =A
		ldr r4, [r0] // r4 = max

for:	cmp r1, #N
		bge fin
		ldr r3, [r2, r1, LSL#2] // r3 = A[i]
		cmp r3, r4
		ble incr
		str r3, [r0] // Guardo A[i] en la direccion de max
		ldr r4, [r0]

incr:	add r1, r1, #1
		b for

fin: 	B .
	 	.end


