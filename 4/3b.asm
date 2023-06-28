# Mapa de registos
# p:$t0
# i:$t1
# *p:$t2
# soma:$t3
# p+1:$t4
.data
array:	.word 7692,23,5,234
 	.eqv print_int10,1
 	.eqv SIZE,4
.text
 	.globl main
main: 	li $t1,0		# i = 0;
	li $t3,0 		# soma = 0;
 	li $t5,SIZE 		
 	addi $t5,$t5,-1		# $t5 = SIZE-1

 	la $t0,array		# p = array;
	
for: 	bgt $t1,$t5,endf 	# {
	mul $t4,$t1,4
	add $t4,$t0,$t4
 	lw $t2,($t4) 		# $t2 = *p;

 	add $t3,$t3,$t2		# soma = soma + (*p);
 	addi $t1,$t1,1		# i++
 
 	j for			# }
 	
endf: 	la $a0,($t3)		
	li $v0, print_int10
	syscall			# print_int10(soma);

 	li $v0,10		# termina o programa
 	syscall
