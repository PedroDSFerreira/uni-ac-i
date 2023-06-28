# res=$f0
# val=$t0

	.data
k1:	.double -32.0
k2:	.double	5.0
k3:	.double 9.0

	.text
	.globl 	main
main:
	addi 	$sp,$sp,-4
	sw 	$ra,($sp)
	li 	$v0,7		# read_float()
	syscall
	mov.d 	$f12,$f0
	jal 	f2c

	mov.d 	$f0,$f12
	li 	$v0,3

	syscall
	
	lw 	$ra($sp)
	addi 	$sp,$sp,4
	
	li 	$v0,0
	jr 	$ra
	
	
	
	
f2c:
	l.d $f2,k1
	l.d $f4,k2
	l.d $f6,k3
	add.d $f0,$f12,$f2
	div.d $f6,$f4,$f6
	mul.d $f12,$f6,$f0
	
	jr $ra
