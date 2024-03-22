#caps.asm
#
#DESC: le uma string e converte ela para maiusculas

#04.11.22 DDA

.include "io.asm"

.data
	
	str1: 	.asciiz "Digite uma string:"
	.align 2
	bsz:	.word 30
	buff1:	.space 30

.text

	printStr(str1)
	
	#ganhar acesso ao inicio do array
	la	$s0, buff1
	
	#ganhar acesso ao tamanho do array
	la	$t0, bsz
	
	lw	$s1, 0($t0)
	leStr($s0, $s1)
	
	#copia o ponteiro da string
	add	$s2, $s0, $zero
	#while(c!=0)
	lb $s7, 0($s2)
WH1:addi	$t6, $zero, 10
	beq	$s7, $t6, SAI1
	#corpo do while	
	addi $s7, $s7, -32
	sb	$s7, 0($s2)
	
	addi $s2, $s2, 1
	lb $s7, 0($s2)
	j	WH1
	#\corpo do while
SAI1:	
	printStr(buff1)
	return0

