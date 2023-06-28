	.data
val:	.double 4.1793
	.text
	.globl main
main:
	addiu $sp,$sp,-4
	sw $ra,($sp)
	
	l.d $f12,val
	jal sqrt
	mov.d $f12,$f0
	li $v0,3
	syscall
	
	lw $ra,($sp)
	addiu $sp,$sp,4
	jr $ra