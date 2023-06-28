      	.data
	.eqv 	STR_MAX_SIZE,30
str1:	.asciiz "Arquitetura de "
str2:	.space 	50
str3:	.asciiz "Computadores I"


	.text
	.globl main
main:
	addiu $sp,$sp,-4
	sw $ra,($sp)
	
	la $a0,str2
	la $a1,str1
	jal strcpy
	
	move $a0,$v0
	li $v0,4
	syscall
	
	li $a0,'\n'
	li $v0,11
	syscall
	
	la $a0,str2
	la $a1,str3
	jal strcat
	move $a0,$v0
	li $v0,4
	syscall
	
	
	lw $ra,($sp)
	addiu $sp,$sp,4
	
	li $v0,0
	jr $ra
	
