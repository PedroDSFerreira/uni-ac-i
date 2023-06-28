# Mapa de registos:
# str: $a0 -> $s0 (argumento é passado em $a0)
# p1: $s1 (registo callee-saved)
# p2: $s2 (registo callee-saved)
#
.data
str:		.asciiz "uoiea"
.text
		.globl main
main:
		addiu $sp,$sp,-4
		sw $ra,0($sp)
		
		la $a0,str
		jal strrev
		
		
		move $a0,$v0
		li $v0,4
		syscall
		
		li $v0,0
		
		
		lw $ra,0($sp)
		addiu $sp,$sp,4
		
		jr $ra
