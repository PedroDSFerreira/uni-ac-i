# res=$f0
# val=$t0

	.data
float_:	.float 	2.59375
zero:	.float 	0.0
	.text
	.globl	main
main:
do:
	li 	$v0,5
	syscall

	move 	$t0,$v0
	mtc1 	$t0,$f1		# $f1 <= $t0
	cvt.s.w $f1,$f1		# $f0 = (float) val
	l.s 	$f2,float_	# load(float)
	mul.s 	$f0,$f1,$f2
	
	li 	$v0,2
	mov.s 	$f12,$f0
	syscall
	
	la 	$a0,'\n'
	li 	$v0,11
	syscall
while:
	l.s 	$f3,zero
	c.eq.s 	$f0,$f3
	bc1f 	do
	
	li 	$v0,1
	jr 	$ra
