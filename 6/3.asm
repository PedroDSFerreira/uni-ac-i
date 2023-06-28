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
 	
 	lw $t2,($t1) 		# $a0 = array[i]= &array[i][0]
 	lb $t3,($t2)
while:	beq $t3,'\0',endw	# for i in str

	move $a0,$t3
	li $v0,11
 	syscall

 	li $a0,'-'		#----------------------------
 	li $v0,11
 	syscall
 	
 	addi $t2,$t2,1
 	lb $t3,($t2)
 	j while
 endw:
 	addi $t1,$t1,4
 	j for
endf:
	jr $ra 
