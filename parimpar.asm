#parimpar.asm

#testa se um numero lido do teclado eh par ou impar

#DDA 26.10.2022

.include "io.asm"

.data

	str1: .asciiz "Digite um numero: "
	str2: .asciiz " O numero eh par"
	str3: .asciiz " O numero eh impar"
	
.text
main:
	#mostra a mensagem de leitura
	li		$v0, 4
	la		$a0, str1
	syscall
	
	#le o inteiro
	#li		$v0, 5
	#syscall
	leInt
	
	#tira o int lido do v0
	add	$s0, $zero, $v0
	
	printInt($s0)
	#divisao inteira do numero
	#addi	$t0, $zero, 2
	#div	$s0, $t0
	#mfhi	$s1  #pega o resto inteiro
	andi	$s1, $s0, 1
	
	
	beq	$s1, $zero, PAR
	#imprime que o num era impar	
	li		$v0, 4
	la		$a0, str3
	syscall
	j		SAI
PAR: #imprime que o numero eh par
	li		$v0, 4
	la		$a0, str2
	syscall	

	#return 0
SAI: li	$v0, 10
	syscall	
