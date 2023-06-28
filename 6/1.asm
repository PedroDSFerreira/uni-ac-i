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
	li $t0,0
	la $t1,array 		# $t1 = &array[0]
	
for:	bge $t0,SIZE,endf
 	
 	sll $t2,$t0,2 		# i*4
 	addu $t2,$t2,$t1	# $t2 = &array[0] + i*4 = &array[i]
 	
 	lw $a0,($t2) 		# $a0 = array[i]
 	li $v0,4
 	syscall

 	la $a0,'\n'		#----------------------------
 	li $v0,11
 	syscall
 	
 	addi $t0,$t0,1
 	j for
endf:
	jr $ra 