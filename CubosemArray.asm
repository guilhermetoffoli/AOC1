#CubosemArray.asm

#le inteiros e armazena-os em um array e calcula seus cubos

.include "io.asm"

.data
	arr: .space 40
	str1: .asciiz "Digite um inteiro: "
	str2: .asciiz "O array tem os seguintes elementos impares em cubos: "
	str3: .asciiz "calculo o cubo dos elem do array"
	str4: .asciiz "Numero deve estar entre 0 e 1000"
	
.text
	printStr(str3)
	printStr(str1)   #msg de leitura de int
	blt $v0, 0, SAIC
	bgt $v0, 1000, SAIC
	la	$s7, arr #ponteiro p/ o array
	
	addi	%s0, $zero, 0 # i = 0
FOR1:
	slti	%t0, $s0, 10
	beq	$t0, $zero, SAI1
	#corpo do for
	li	$v0,
	syscall
	
	li	$v0,
	syscall
	
	sw	$v0, 0($s7)
	addi	$s7, $s7, 4
	#end corpo do for
	addi 	$s0, $s0, 1 #i++]
	j	FOR1
	
	la	$a0, arr
	jal	CUBOS
	
	li	$v0, 10
	syscall
	
CUBOS:	sw	$ra, 0($sp)
	sw	$a0, -4($sp)
	sw	$s0, -8($sp)
	sw	$s1, -12($sp)
	sw	$s7, -16($sp)
	addi    $sp, %sp, -20
	add	$s7, $zero, $a0 #ponteiro para arr

	printStr(str2)
	
	addi 	$s0, $zero, 0  # i= 0
FORC:   slti	%t0, $s0, 10
	beq	$t0, $zero, SAIC
	
	lw	$s1, 0($s7)
	
	addi 	$s6, $zero, $s7#verificando se é par
	andi 	$s4, $s6, 1
	beq	$s4, $zero, FORC
	
	mul	$s1, $s1
	mflo	$t1
	mul	$t1, $s1
	mflo	$t1
	sw	$t1, 0($s7)
	
	printInt($v0)
	j	FORC
SAIC:
	addi  	$sp, $sp, 20
	lw	$ra, 0($sp)
	lw	$a0, -4($sp)
	lw	$s0, -8($sp)
	lw	$s1, -12($sp)
	lw	$s7, -16($sp)
	jr	$ra
