
.data #variaveis 
	msg: .asciiz "Olá mundo!" #mensagem a ser exibida para o usuário
	car: .byte 'A'


.text #área para instruçoes
	li $v0, 4 #instrução para impressao da string
	li $v0, 4 
	la $a0, msg #indica o end em que msg está
	la $a0, car
	syscall #faça, imprima
	
	li, $v0, 10
	syscall
