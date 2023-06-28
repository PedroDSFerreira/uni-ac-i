	.data
	.text
	.globl main
main:	li $v0,5		#read binarie number
	syscall
	add $t0,$0,$v0
	
	srl $t2,$t0,1		# bin >> 1
	xor  $t1,$t0,$t2
