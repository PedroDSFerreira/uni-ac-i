# Mapa de registos

	.data
k1:	.float 1.0
kt:	.float 1.7893
	.text
	.globl main
main:
	addiu $sp,$sp,-4
	sw $ra,($sp)
	
	l.s $f12,kt
	li $a0,3
	jal xtoy
	
	mov.s $f12,$f0
	li $v0,2
	syscall
	
	
	lw $ra,($sp)
	addiu $sp,$sp,4
	jr $ra