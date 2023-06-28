# Mapa de registos
# x:$12-> $f20
# y:$a0->$s0
# i:$t0
# result:$f0
	.data
k1:	.float 1.0
	.text
	.globl xtoy

xtoy:
	addiu $sp,$sp,-12
	sw $ra,($sp)
	sw $s0,4($sp)
	s.s $f20,8($sp)
	
	mov.s $f20,$f12
	move $s0,$a0
	jal absol
	move $t1,$v0
	li $t0,0
	l.s $f0,k1
for:	
	bge $t0,$t1,endfor
if:
	ble $s0,0,else
	mul.s $f0,$f0,$f20
	j endif
else:
	div.s $f0,$f0,$f20
endif:
	addiu $t0,$t0,1
	j for
endfor:
	lw $ra,($sp)
	lw $s0,4($sp)
	l.s $f20,8($sp)
	addiu $sp,$sp,12
	
	jr $ra
		
		
