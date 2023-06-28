	.data
input:	.asciiz "Introduza um numero: "
bin: 	.asciiz "\nO valor em binário é: "
gray:	.asciiz "\nValor em código Gray: "
	.eqv print_string,4
	.eqv read_int,5
	.eqv print_hex,34
	.text
	.globl main
main:	li $t0,0		# gray = 0
	li $t1,0		# bin = 0
	li $t2,0		# mask = 0
	
	la $a0,input		# print_string(input);
 	li $v0,print_string 		
	syscall
	
	li $v0,read_int		# gray = read_int();
 	syscall
 	move $t0,$v0
 	
 	srl $t2,$t0,1		# mask = gray >> 1
 	move $t1,$t0		# bin = gray
 	
while:	beqz $t2,end
	xor $t1,$t1,$t2
	srl $t2,$t2,1
	j while

end:	la $a0,gray		# print_string(gray);
 	li $v0,print_string 		
	syscall
	
	la $a0,($t0)		# print_int16(gray)
	li $v0,print_hex
	syscall
	
	la $a0,bin		# print_string(bin);
 	li $v0,print_string 		
	syscall
	
	la $a0,($t1)		# print_int16(bin)
	li $v0,print_hex
	syscall