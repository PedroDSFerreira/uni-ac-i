# i: $t0
#
 	.eqv SIZE,3
.data
array:	.word str1,str2,str3
str1: 	.asciiz "Array"
str2: 	.asciiz "de"
str3: 	.asciiz "ponteiros"
.text
 	.globl main
main:
	la $t1,array 		# $t1 = &array[0]
	li $t0,SIZE

	sll $t0,$t0,2
	add $t0,$t0,$t1		# $t0 = &array[0] + SIZE*4
	
for:	bge $t1,$t0,endf
 	
 	lw $a0,($t1) 		# $a0 = array[i]
 	li $v0,4
 	syscall

 	li $a0,'\n'		#----------------------------
 	li $v0,11
 	syscall
 	
 	addi $t1,$t1,4
 	j for
endf:
	jr $ra 