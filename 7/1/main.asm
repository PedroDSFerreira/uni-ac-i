# O argumento da fun��o � passado em $a0
# O resultado � devolvido em $v0
# Sub-rotina terminal: n�o devem ser usados registos $sx
.data
str:	.asciiz "Ac"
.text
.globl main
main:
	la $a0,str
	
	addiu $sp,$sp,-4
	sw $ra,($sp)
	jal strlen
	lw $ra,($sp)
	addiu $sp,$sp,4
	
	move $a0,$v0
	
	li $v0,1
	syscall
	
	li $v0,0
	jr $ra



