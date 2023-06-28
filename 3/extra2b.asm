	.data
input:	.asciiz "Introduza dois numeros: "
result: .asciiz "\nResultado: "
	.eqv print_string,4
	.eqv print_int,1
	.eqv read_int,5
	.text
	.globl main
	
main:	li $t0,0		# res=0
	li $t1,0		# i = 0
	li $t2,0		# mdor = 0
	li $t3,0		# mdo = 0
	
	la $a0,input		# print_string(input)
 	li $v0,print_string 		
	syscall
	
	li $v0,read_int		# read_int() & 0x0F
 	syscall
 	and $t2,$v0,0x0FFFF
 	
 	li $v0,read_int		# read_int() & 0x0F
 	syscall
 	and $t3,$v0,0x0FFFF
 	
while:	beqz $t2,end
	bge $t1,16,end
	addi $t1,$t1,1
	
	and $t4,$t2,0x00000001
	beqz $t4,endif
	addu $t0,$t0,$t3
endif:	sll $t3,$t3,1
	srl $t2,$t2,1
	
	
	j while
	
end:	addi $t1,$t1,1
	la $a0,result		# print_string(result)
 	li $v0,print_string 		
	syscall
	
	la $a0,($t0)		# print_int(res)
	li $v0,print_int
	syscall