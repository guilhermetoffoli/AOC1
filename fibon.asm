#fibon.asm

#calcula os n primeiro elementos da serie de fibo

#DDA 26.10.2022

.include "io.asm"

.data
str1: .asciiz "Digite o numero de termos: "
str2: .asciiz "1"
str3: .asciiz ", "
.text

	printStr(str1)
	leInt
	add	$s7, $zero, $v0 # n salvo em s7
	
	#testa se n == 1
	addi	$t0, $zero, 1
	beq		$t0, $s7, N1
	addi	$t0, $zero, 2
	beq		$t0, $s7, N2
	printStr(str2)
	printStr(str3)
	printStr(str2)
	printStr(str3)
	
	addi	$s5, $zero, 1  #ant1
	addi	$s6, $zero, 1  #ant2
	
	#for(i = 2; i<n; i++)
	addi	$s0, $zero, 2	# i = 2
FOR1:
	slt		$t0, $s0, $s7
	beq		$t0, $zero, SAIFOR1
	###corpo do for
	#calcular o termo atual
	add	$t1, $s5, $s6
			
	#atualizar os anteriores
	add	$s6, $s5, $zero
	add	$s5, $t1, $zero
	
	printInt($t1)
	printStr(str3)
	#corpo do for
	addi	$s0, $s0, 1
	j		FOR1
SAIFOR1:	
	j		FIM1
N1: printStr(str2)
	j		FIM1
N2: printStr(str2)
	printStr(str3)
	printStr(str2)
FIM1:
	return0
