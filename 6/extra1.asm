.data
str1: .asciiz "Nr. de caracteres: "
str2: .asciiz "\nNr. de letras: "
str3: .asciiz "\nMaior palavra: "
.text
	.globl main
	
main:	move $t1,$a0		# $t1 = argc
	move $t2,$a1		# t2 = *argv[]
	
	li $t0,0			# i=0
	li $t1,0			# last_word_size = 0
for:	bge $t0,$t1,endf		# if (i < argc)
	
	sll $t3,$t0,2
	addu $t3,$t2,$t3		# $t3 = &argv[i]
	lw $t4,($t3)		# $at4 = argv[i]
	

	addi $t5,$t5,0		# counter_char = 0
	addi $t6,$t6,0		# i = 0
	lb $t7,($t4)		# argv[i][0]
	
	addi $t8,$t8,0		# counter_letters = 0
for1:	beq $t7,'\0',endf1
	# 65-90 97-122 (ascii)
if:	blt $t7,
	addi $t8,$t8,1		# counter_letters++
endif:
	addi $t5,$t5,1		# counter_char++
	addi $t6,$t6,1		# i++
	addu $t7,$t4,$t6
	lb $t7($t7)
	j for1
	
endf1:	


	li $v0,4
	la $a0,str1
	syscall			# print_str("Nr. de caracteres:"); 
	
	li $v0,1
	move $a0,$t5
	syscall			# print_int(counter_char); 
	
	li $v0,4
	la $a0,str2
	syscall			# print_str("\nNr. de letras: "); 
	
	li $v0,1
	move $a0,$t8
	syscall			# print_int(counter_letters); 
	
	li $v0,4
	la $a0,str2
	syscall			# print_str("\nMaior palavra: "); 
	
	li $v0,4
	syscall			# print_str(maior_palavra);
	
	addi $t0,$t0,1		# i++
	j for
endf:	jr $ra





num_letters:
