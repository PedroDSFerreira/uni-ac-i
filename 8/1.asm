# res = $v0
# s = $a0
# *s = $t0
# digit = $t1

	.data
str:	.asciiz	"2020 e 2024 sao anos bissextos"
	.text
	.globl	main
main:
	addiu 	$sp,$sp,-4
	sw 	$ra,($sp)
	la 	$a0,str
	jal 	atoi
	move 	$a0,$v0
	li 	$v0,1
	syscall
	li 	$v0,0
	lw 	$ra,($sp)
	addiu 	$sp,$sp,4
	jr 	$ra

atoi:
	li 	$v0,0		# res = 0	
while:	lb 	$t0,($a0)
	blt 	$t0,'0'endw
	bgt 	$t0,'9',endw	# while((*s >= '0') && (*s <= '9'))
	
	sub 	$t1,$t0,'0'	# digit = *s - '0';
	addiu 	$a0,$a0,1		# s++
	mul 	$v0,$v0,10		# res = 10 * res
	addu 	$v0,$v0,$t1	# res = 10 * res + digit;
	j 	while
endw:
	jr 	$ra			# return res;
