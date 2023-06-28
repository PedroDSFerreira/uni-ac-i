	.data
str1:	.asciiz "\nN. Mec: "
str2:	.asciiz "\nPrimeiro Nome: "
str3:	.asciiz "\nÚltimo Nome: "
str4:	.asciiz "\nNota: "

	.align 2
stg:	.space 4			# int id_number
	.space 18			# char first_name[18];
	.space 15			# char last_name[15];
	.space 4			# float grade;
	
	.text
	
	.globl main
	
main:	addiu $sp,$sp,-4
	sw $ra,0($sp)
	
	la $t0,stg
	
	la $a0,str1
	li $v0,4
	syscall				# print_str("N. Mec: ");
	
	li $v0,5
	syscall
	sw $v0,0($t0)			# stg.id_number = read_int();
	
	la $a0,str2
	li $v0,4
	syscall				# print_str("\nPrimeiro Nome: ");
	
	addiu $a0,$t0,4
	li $a1,17
	li $v0,8
	syscall				# read_string(stg.first_name, 17);
	
	la $a0,str3
	li $v0,4
	syscall				# print_str("\Ultimo Nome: ");
	
	addiu $a0,$t0,22
	li $a1,14
	li $v0,8
	syscall				# read_string(stg.last_name, 14);
	
	la $a0,str4
	li $v0,4
	syscall				# print_str("\nNota: ");
	
	li $v0,6
	syscall
	s.s $f0,40($t0)			# read_float(stg.grade);
	
	move $a0,$t0
	jal print			# print(stg)
	
	li $v0,0
	
	lw $ra,0($sp)
	addiu $sp,$sp,4
	jr $ra				# return 0
