
# add $t0, $t1, $t2 - t0 = t1 + t2
# addi $t0, $t1, 15 - t0 = t1 + 15
#sub mesma coisa
#mul mesma coisa
#div

.include "io.asm"

.data
	char: .byte '\n'

.text
	li $v0, 4  
	la $a0, char
	addi $t1, $zero, 15
	addi $t0, $zero, 15
	add $s0, $t0, $t1
	
	addi $t3, $zero, 100
	addi $t4, $zero, 50
	sub $s1, $t3, $t4
	
	printInt($s0)
	printStr(char)
	printInt($s1)
	
	return0
	
	