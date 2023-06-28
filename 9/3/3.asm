# INCOMPLETO
	.data
	.eqv 	SIZE,10
a:	.space 	80

	.text
	.globl 	main
main:
	addiu 	$sp,$sp,-4
	sw 	$ra,($sp)
	
	lw 	$ra,($sp)
	addiu 	$sp,$sp,4
	
	li 	$v0,0
	jr 	$ra

average:

	
