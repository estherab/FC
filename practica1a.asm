.global start

.data
X:		.word 0x03
Y:		.word 0x0A

.bss
Mayor:	.space 4

.text
start:
	LDR R4, =X // Carga en r4 la direccion de X
	LDR R3, =Y
	LDR R5, =Mayor // Guarda en r5 la dirección de Mayor, donde se han reservado 4 bytes
	LDR R1, [R4] // Carga en r1 el contenido de la dirección de memoria que hay en r4
	LDR R2, [R3]
	CMP R1, R2
	BLE else
	STR R1, [R5]
	B FIN

else:	STR R2, [R5]

FIN: B .
	 .end
