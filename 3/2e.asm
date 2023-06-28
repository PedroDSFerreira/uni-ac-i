	.data
input:	.asciiz "Introduza um numero: "
result: .asciiz "\nO valor em binário é: "
	.eqv print_string,4
	.eqv read_int,5
	.eqv print_char,11
	
	.text
	.globl main
	
main: 	li $t0,0			# value = 0
	li $t1,0			# bit = 0
	li $t2,0			# i = 0
	li $t3,0			# flag = 0
	
	la $a0,input			# print_string(str1);
 	li $v0,print_string 		
	syscall 			
	
	
 	li $v0,read_int			# value=read_int();
 	syscall
 	move $t0,$v0 				
 	 				
 	la $a0,result			# print_string(str2);
 	li $v0,print_string 		
	syscall 
	 				
		
for: 	bge $t2,32,endfor 		# while(i < 32) {
 	
 	andi $t1,$t0,0x80000000		# (instrução virtual)
 	srl $t1,$t1,31			# bit = (value & 0x80000000) >> 31

if1:	beq $t3,1,then1			# if(flag == 1 || bit != 0)
	bne $t1,0,then1
	j endif1
	
then1:	li $t3,1			# flag = 1
	rem $t6,$t2,4			# i%4
if2:	bnez $t6,endif2		# if((i % 4) == 0)
	la $a0,' '			# print_char('0' + bit)
  	li $v0,print_char
  	syscall

endif2:
	add $t1,$t1,0x30
	la $a0,($t1)			# print_char('0' + bit)
  	li $v0,print_char
  	syscall

endif1:								
 	sll $t0,$t0,1			# value << 1
 	addi $t2,$t2,1			# i++;
 	
 	j for
 	
endfor:
 	li $v0,10
 	syscall
