.extern _stack
.global start

.EQU N, 8

.data
A: .word 7, 3, 25, 4, 75, 2, 1, 1

.bss
B: .space N*4
MAX: .space 4
IND: .space 4


.text
start:
			LDR SP, =_stack

			MOV R0, #0		// i
			MOV R1, #0	    // j
			LDR R2, =A
			LDR R3, =B
			MOV R9, #0

	FOR1:		CMP R1, #N
				BGE FIN_FOR1

				BL MAX

				LDR R5, [R2, R0, LSL#2]	// Extraemos el máximo del vector
				STR R5, [R3, R1, LSL#2]	// Guardamos max en B
				STR R9, [R2, R0, LSL#2]	// Guardamos un 0 en la posicion de A
				ADD R1, R1, #1

				B FOR1
	FIN_FOR1:

FIN: 		B .

MAX:
			PUSH {R4-R8}
			PUSH {LR}

			MOV R5, #0 // max = 0
			MOV R4, #0

	FOR2:		CMP R4, #N
				BGE FIN_FOR2

				LDR R6, [R2, R4, LSL#2]

				PUSH {R0, R1, R2}
				MOV R0, R5	// r0 = max
				MOV R1, R6

				BL COMPARA

				MOV R8, R0
				POP {R0, R1, R2}

				CMP R8, #1
				BNE FIN_IF
				MOV R5, R6	// r5 = max
				MOV R7, R4  // r7 = indice

	FIN_IF:		ADD R4, R4, #1
				B FOR2
	FIN_FOR2:
				MOV R0, R7
				POP {LR}
				POP {R4-R8}
				MOV PC, LR

	COMPARA:
				CMP R1, R0
				MOV R2, #0
				BLE FIN_SUBR
				MOV R2, #1

	FIN_SUBR:
				MOV R0, R2
				MOV PC, LR

			.end
