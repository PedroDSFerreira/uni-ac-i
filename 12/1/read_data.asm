	.data
str1:	.asciiz "\nN. Mec: "
str2:	.asciiz "\nPrimeiro Nome: "
str3:	.asciiz "\nÚltimo Nome: "
str4:	.asciiz "\nNota: "
	.text
	.globl 	read_data
	
read_data:
	move 	$t0,$a0			# student *st
	move	$t1,$a1			# int ns
	li 	$t2,0			# i = 0
for:
	bge 	$t2,$t1,endfor
	mul	$t3,$t2,44
	addu	$t3,$t0,$t3
	
	la 	$a0,str1
	li 	$v0,4
	syscall				# print_str("N. Mec: ");
	
	li 	$v0,5
	syscall
	sw 	$v0,0($t3)		# stg.id_number = read_int();
	
	la 	$a0,str2
	li 	$v0,4
	syscall				# print_str("\nPrimeiro Nome: ");
	
	addiu 	$a0,$t3,4
	li 	$a1,17
	li 	$v0,8
	syscall				# read_string(stg.first_name, 17);
	
	la 	$a0,str3
	li 	$v0,4
	syscall				# print_str("\Ultimo Nome: ");
	
	addiu 	$a0,$t3,22
	li 	$a1,14
	li 	$v0,8
	syscall				# read_string(stg.last_name, 14);
	
	la 	$a0,str4
	li 	$v0,4
	syscall				# print_str("\nNota: ");
	
	li 	$v0,6
	syscall
	s.s 	$f0,40($t3)		# read_float(stg.grade);
	
	
	addiu	$t2,$t2,1		# i++
	j for
endfor:
	jr 	$ra				
