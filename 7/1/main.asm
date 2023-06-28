# O argumento da função é passado em $a0
# O resultado é devolvido em $v0
# Sub-rotina terminal: não devem ser usados registos $sx
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



