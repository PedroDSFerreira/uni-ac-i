# Mapa registos
# val  = $f2
# val1 = $f0
# zero = $f1
# res  = $f3

	.data
val1:	.float	2.59375
zero:	.float 	0.0
	.text
	.globl 	main
	
main:
	l.s $f0,val1
	l.s $f1,zero
do:
	li	$v0,5
	syscall
	
	mtc1 	$v0,$f2
	cvt.s.w $f2,$f2
	mul.s	$f3,$f2,$f0
	
	mov.s	$f12,$f3
	li	$v0,2
	syscall
	
while:
	c.eq.s 	$f3,$f1
	bc1f	do
end:
	li $v0,0
	jr $ra
	
	
	