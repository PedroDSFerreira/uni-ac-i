# Mapa de registos:
# *p = $t0
	.globl strcat
strcat:		
	addi 	$sp,$sp,-8
	sw 	$ra,($sp)
	sw	$a0,4($sp)
while:		
	lb 	$t0,($a0)	# char *p = dst
	beq 	$t0,'\0',endw	# while(*p != '\0')
	addiu 	$a0,$a0,1	# p++
	j while
endw:
	jal 	strcpy		# strcpy(p, src)
	lw	$v0,4($sp)
	lw 	$ra,($sp)
	addi 	$sp,$sp,8
	jr 	$ra		# return dst
