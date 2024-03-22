.include "io.asm"

.data
	msg: .asciiz "Forneca um numero: "
	par: .asciiz "O numero eh par"
	impar: .asciiz "o numero eh impar"
.text
	printStr(msg)  #pedindo o numero
	leInt          #lendo o inteiro
	
	li $t0, 2    #colocando o 2 no regist t0
	div $v0, $t0
	mfhi $t1 #$t1 possue o resto da divisao por 2
	
	beq $t1, $zero, imprimePar
	printStr(impar)

	return0
	
	imprimePar:
		printStr(par)

	
	