	.data
str:	.asciiz "Input x: "
int16:	.asciiz "\nHexadecimal Number: "
int10:	.asciiz "\nInteger  Number: "
int10u:	.asciiz "\n Unsigned Integer Number: "

	.text
	.globl main
main:	li $v0,4
	la $a0,str
	syscall
	
	li $v0,5
	syscall
	add $t3,$0,$v0
	
	or $t0,$0,$t3 
	ori $t2,$0,-8 	# $t2 = 8
	add $t1,$t0,$t0 # $t1 = $t0 + $t0 = x + x = 2 * x
	add $t1,$t1,$t2 # $t1 = $t1 + $t2 = y = 2 * x + 8
	
	li $v0,4
	la $a0,int10
	syscall
	
	li $v0,1
	la $a0,($t1)
	syscall
	
	li $v0,4
	la $a0,int16
	syscall
	
	li $v0,34
	la $a0,($t1)
	syscall
	
	
	li $v0,4
	la $a0,int10u
	syscall
	
	li $v0,36
	la $a0,($t1)
	syscall
	
	li $v0,10
	syscall
