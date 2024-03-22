# Escreva um programa em assembly que calcule o produto vetorial de dois vetores de 4 inteiros lidos do teclado.

.include "io.asm"

.data
    str1: .asciiz "Digite os inteiros do vetor 1: "
    str2: .asciiz "Digite os inteiros do vetor 2: "
    array1: .space 16
    array2: .space 16

.text
	la    $s7, array1  #aponta pro array
	la    $s6, array2  #aponta pro array
	add    $s0, $zero, $zero #i = 0
FOR1:
    #if($s0 > 4) #t0 = 0
   	 slti    $t0, $s0, 4          #condicao de parada 
   	 beq    $t0, $zero, FOR2

  	 printStr(str1)

   	 leInt

   	 sw    $v0, 0($s7) #armazena no array

   	 addi    $s7, $s7, 4 #pula posicao

   	 addi    $s0, $s0, 1 #i++
   	 add    $s1, $zero, $zero #i = 0
   	 j    FOR1
	

FOR2:		
	#if($s0 > 4) #t0 = 0
   	 slti    $t0, $s1, 4          #condicao de parada 
   	 beq    $t0, $zero, PROD

  	 printStr(str2)

   	 leInt

   	 sw    $v0, 0($s6) #armazena no array

   	 addi    $s6, $s6, 4 #pula posicao

   	 addi    $s1, $s1, 1 #i++
   	 j    FOR2
	
PROD:
	subi $s7, $s7, -16 	#voltando pro indice 0
	subi $s6, $s6, -16
	
	lw 	$v0, $s7
	lw	$v1, $s6
	mul	$t4, $v0, $v1
	la	$a0, $t4
	printInt(%a0)

