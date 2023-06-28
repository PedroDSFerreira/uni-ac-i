	.data
input:	.asciiz "Introduza um numero: "
result: .asciiz "\nO valor em binário é:"
	.eqv print_string,4
	.eqv read_int,5
	.eqv print_char,11
	
	.text
	.globl main
	
main: 	li $t0,0			# value = 0
	li $t1,0			# bit = 0
	li $t2,0			# i = 0
	
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
	rem $t3,$t2,4
if1:	bnez $t3,continue		# if(i%4 == 0)
	la $a0,' '			# print_char(' ');
 	li $v0,print_char 		
 	syscall
 	
continue:  	
 	andi $t1,$t0,0x80000000		# (instrução virtual)
if2: 	beqz  $t1,else2			# if(bit != 0)
 	
	la $a0,'1'			# print_char('1');
 	li $v0,print_char 		
 	syscall
 	
 	sll $t0,$t0,1			# value << 1
 	addi $t2,$t2,1			# i++;
 	j for
 	
else2: 	la $a0,'0'			# print_char('0');
 	li $v0,print_char 		
 	syscall
 					
 	sll $t0,$t0,1			# value << 1
 	addi $t2,$t2,1			# i++;
 	j for
endfor: #
 	li $v0,10
 	syscall
