#io.asm

.macro leInt
	li	$v0, 5
	syscall
.end_macro

.macro printInt(%r)
	li	$v0, 1
	add	$a0, $zero, %r 
	syscall
.end_macro

.macro leFloat
	li	$v0, 6
	syscall
.end_macro 

.macro printFloat(%r)
	li	$v0, 2
	add.s   $f1, $f0,%r
	syscall
.end_macro

.macro leDouble
	li	$v0, 7
	syscall
.end_macro

.macro printDouble(%r)
	li	$v0, 3
	add.s $f1, $f0,%r
	syscall
.end_macro

.macro leStr(%b, %bsz)
	li	$v0, 8
	add	$a0, $zero, %b
	add	$a1, $zero, %bsz
	syscall
.end_macro

.macro printStr(%s)
	li	$v0, 4
	la	$a0, %s
	syscall
.end_macro

.macro return0
	li	$v0, 10
	syscall
.end_macro
