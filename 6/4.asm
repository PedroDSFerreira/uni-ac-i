.data
str1: .asciiz "Nr. de parametros: "
str2: .asciiz "\nP"
str3: .asciiz ": "
.text
	.globl main
	
main:	move $t1,$a0		# $t1 = argc
	move $t2,$a1		# t2 = *argv[]
	
	li $v0,4
	la $a0,str1
	syscall			# print_str("Nr. de parametros: ");
	
	li $v0,1
	move $a0,$t1
	syscall			# print_int10(argc);
	
	li $t0,0		# i=0
for:	bge $t0,$t1,endf	# if (i < argc)
	
	li $v0,4
	la $a0,str2
	syscall			# print_str("\nP"); 
	
	li $v0,1
	move $a0,$t0
	syscall			# print_int(i); 
	
	li $v0,4
	la $a0,str3
	syscall			# print_str(": "); 
	
	sll $t3,$t0,2
	addu $t3,$t2,$t3	# $t3 = &argv[i]
	lw $a0,($t3)		# $a0 = argv[i]
	
	li $v0,4
	syscall			# print_str(argv[i]);
	
	addi $t0,$t0,1		# i++
	j for
endf:	jr $ra