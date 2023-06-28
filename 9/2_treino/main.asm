	.data
input:	.asciiz "Insira o valor de temperatura(F): "
result1:.asciiz	"º F = "
result2:.asciiz "º C"
	.align 3
	.text
	.globl main
main:
	addiu 	$sp,$sp,-16
	sw	$ra,0($sp)

	li	$v0,4
	la	$a0,input
	syscall

	li	$v0,7
	syscall

	mov.d	$f12,$f0
	mov.d	$f20,$f0

	s.d 	$f20,8($sp)
	jal	f2c
	l.d	$f20,8($sp)

	li	$v0,3
	mov.d	$f12,$f20
	syscall

	li	$v0,4
	la	$a0,result1
	syscall

	li	$v0,3
	mov.d	$f12,$f0
	syscall

	li	$v0,4
	la	$a0,result2
	syscall

	lw	$ra,0($sp)
	addiu	$sp,$sp,16

	li	$v0,0
	jr	$ra
