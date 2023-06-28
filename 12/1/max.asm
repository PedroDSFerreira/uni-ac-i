		.data
max_grade:	.float -20.0
sum:		.float 0.0
		.text
		.globl	max
max:	
		mul	$t2,$a1,44		# ns*size
		addu	$t0,$a0,$t2		# st + ns*size
		move	$t1,$a0			# p = st
		l.s	$f1,max_grade
		l.s	$f2,sum
for:
		bge 	$t1,$t0,endfor
		l.s 	$f3,40($t1)		# p->grade
		add.s	$f2,$f2,$f3		# sum += p->grade
		
if:
		c.le.s 	$f3,$f1
		bc1t 	endif
		
		mov.s	$f1,$f3
		move	$v0,$t1
endif:
		addiu	$t1,$t1,44
		j	for
endfor:
		mtc1 	$a1,$f4			# $f4 <= $a1
		cvt.s.w $f4,$f4			# $f4 = (float) ns
		
		div.s	$f12,$f2,$f4
		
		jr 	$ra
