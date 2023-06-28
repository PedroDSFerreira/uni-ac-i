# Mapa de registos:
# exit_value = $t0
# str1 = $s1
# str2 = $s2
# 

.data
		.eqv STR_MAX_SIZE,30
str1:		.asciiz "I serodatupmoC ed arutetiuqrA"
str2:		.space 31
err:		.asciiz "String too long: "

.text
		.globl main
main:
		addi $sp,$sp,-12
		sw $ra,($sp)
		
		la $s1,str1			# static char str1[]
		la $s2,str2			# static char str2[STR_MAX_SIZE + 1]
		sw $s1,4($sp)
		sw $s2,8($sp)
if:
		move $a0,$s1
		jal strlen
		bgt $v0,STR_MAX_SIZE,else	# if(strlen(str1) <= STR_MAX_SIZE) {
		move $a0,$s2
		move $a1,$s1
		jal strcpy			# strcpy(str2, str1)
		move $s2,$v0
		
		move $a0,$s2
		li $v0,4
		syscall				# print_string(str2)
		
		li $v0,11
		li $a0,'\n'
		syscall				# print_char('\n'); 
		
		move $a0,$s2
		jal strrev			# strrev(str2)
		move $a0,$v0
		li $v0,4
		syscall				# print_string(strrev(str2))
		
		li $t0,0			# exit_value = 0
		j endif
else:
		li $v0,4
		la $a0,err
		syscall				# print_string("String too long: ")
		
		move $a0,$s1
		jal strlen			# strlen(str1)
		move $a0,$v0
		li $v0,1
		syscall				# print_int10(strlen(str1))
		
		li $t0,-1			# exit_value = -1
endif:
		lw $ra,($sp)
		addi $sp,$sp,12
		jr $ra				# return exit_value
	
