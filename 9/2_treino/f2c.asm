	.data
val1:	.double	5.0
val2:	.double 9.0
val3:	.double -32.0

	.text
	.globl f2c
f2c:
	l.d	$f2,val1
	l.d	$f4,val2
	l.d	$f6,val3
	div.d	$f8,$f2,$f4	# 5.0/9.0
	add.d	$f10,$f12,$f6	# ft - 32.0
	mul.d	$f0,$f8,$f10	# (5.0 / 9.0 * (ft – 32.0))
	jr $ra
