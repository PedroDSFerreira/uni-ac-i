		.data
		.eqv 	MAX_STUDENTS,4
str1:		.asciiz "\nMedia: "
		.align 	2
st_array:	.space 	176
media:		.space 	4
		.text
		.globl 	main
main:
		addiu 	$sp,$sp,-4
		sw 	$ra,0($sp)
		
		la 	$a0,st_array
		l.s	$f12,media
		
		li	$a1,MAX_STUDENTS
		jal	read_data
		
		la	$a0,st_array
		li	$a1,MAX_STUDENTS
		jal	max
		move	$t1,$v0			# temporary
		
		la 	$a0,str1
		li 	$v0,4
		syscall
		
		li $v0,2
		syscall
		
		move $a0,$t1
		jal print_student

		
kk:		lw	$ra,0($sp)
		addiu	$sp,$sp,4
		li	$v0,0
		jr 	$ra
		
