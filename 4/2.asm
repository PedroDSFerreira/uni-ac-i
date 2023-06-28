# Mapa de registos
# num: $t0
# p: $t1
# *p: $t2
.data
	.eqv SIZE,20
	.eqv SIZE1,21
	.eqv read_string,8
	.eqv print_int10,1
str:	.space SIZE1

.text
 	.globl main
main: 	la $t1,str 		# p = str;
 	move $a0,$t1
 	li $a1,SIZE		# $a1=SIZE
 	li $v0,read_string
 	syscall 		# read_string(str,SIZE)
 	
while: 	lb $t2,($t1)		# while(*p != '\0')
 	beq $t2,'\0',endw 	# {
 	blt $t2,'0',endif 	# if(str[i] >='0' &&
 	bgt $t2,'9',endif 	# str[i] <= '9')
 	addi $t0,$t0,1 		# num++;
endif:
 	addiu $t1,$t1,1 	# p++;
 	j while			# }
 	
endw: 	la $a0,($t0)		
	li $v0, print_int10
	syscall			# print_int10(num);

 	li $v0,10		# termina o programa
 	syscall