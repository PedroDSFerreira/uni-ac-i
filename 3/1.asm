	.data
input:	.asciiz "Introduza um numero: "
i_val:	.asciiz "Valor ignorado\n"
result:	.asciiz "A soma dos positivos e': "
	.text
	.globl main
	
main:
	add  $t0,$t0,$0	#int soma
	add  $t1,$t1,$0	#int value
	add  $t2,$t2,$0	#int i
	
for:	bge $t2,5,end		#if(i < 5) 
	
	li $v0,4
	la $a0,input
	syscall
	
	li $v0,5
	syscall
	
	move $t1,$v0
	
if:	ble $t1,$0,else		#if(value>0)
	add $t0,$t0,$t1
	
	addi $t2,$t2,1		#i++
	j for

else:	li $v0,4
	la $a0,i_val
	syscall
	
	addi $t2,$t2,1		#i++
	j for

end:	li $v0,4
	la $a0,result
	syscall
	
	move $a0,$t0
	li $v0,1
	syscall
	