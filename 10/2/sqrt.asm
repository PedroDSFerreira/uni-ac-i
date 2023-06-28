# Mapa de registos
# xn: $f0
# aux: $f2
# i: $t0
# val: $f12

	.data
k10:	.double 	1.0
zero:	.double 	0.0
k05:	.double 	0.5
	.text
	.globl 	sqrt
sqrt:
	l.d 	$f0,k10
	l.d 	$f6,k05
	l.d 	$f8,zero
	li 	$t0,0		# i = 0
		
if:
	c.le.d 	$f12,$f8	# if(val > 0.0)
	bc1t 	else
do:
	
	mov.d 	$f2,$f0		# aux = xn
	div.d 	$f4,$f12,$f0
	add.d 	$f4,$f0,$f4
	mul.d 	$f0,$f6,$f4	# xn = 0.5 * (xn + val/xn)
while:
	c.eq.d 	$f2,$f0		# while((aux != xn) &&
	bc1t 	endw
	addiu 	$t0,$t0,1	# i++
	blt 	$t0,25,do	# 	(++i < 25))
endw:
	j 	endif
else:
	l.d 	$f0,zero
endif:
	jr 	$ra