# Mapa de registos
# p: $t0
# *p: $t1
# lista+Size: $t2 
.data
str1:	.asciiz "; "
str2:	.asciiz "\nConteudo do array:\n"
lista:	.word 8,-4,3,5,124,-15,87,9,27,15	# a diretiva ".word" alinha num endere�o m�ltiplo de 4
 	.eqv print_int10,1
 	.eqv print_string,4
 	.eqv SIZE,40
.text
	.globl main
main:	la $a0,str2
	li $v0,print_string
	syscall

	la $t0,lista
	addiu $t2,$t0,SIZE
while:	bge $t0,$t2,endw
	lw $t1,($t0)
	
	move $a0,$t1
	li $v0,print_int10
	syscall
	
	la $a0,str1
	li $v0,print_string
	syscall
	
	addiu $t0,$t0,4
	
	j while
endw:	jr $ra