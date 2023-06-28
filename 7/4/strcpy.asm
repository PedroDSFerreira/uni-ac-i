# char *strcpy(char *dst, char *src)
# i=$t0
# *src[i]=$t1
# src[i]=$t2
# *dst[i]=$t3
	.globl 	strcpy
strcpy:
	li 	$t0,0		# i=0
do:
	addu 	$t1,$a1,$t0	# &src[i]
	lb 	$t2,($t1)	# src[i]
	addu 	$t3,$a0,$t0	# &dst[i]
	sb 	$t2,($t3)	# dst[i]=src[i]
while:
	beq 	$t2,'\0',endw	# while(src[i] != '\0')
	addi 	$t0,$t0,1	# i++
	j 	do
endw:
	move 	$v0,$a0
	jr 	$ra
