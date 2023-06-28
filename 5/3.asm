# Mapa de registos
# lista + SIZE*4 = $t0
# &lista: $t1
# SIZE-1 = $t2
# j = $t3
# houve_troca: $t4
# i: $t5
# lista: $t6
# lista + i: $t7

.data
 	.eqv FALSE,0
 	.eqv TRUE,1
 	.eqv SIZE 10

str1: 	.asciiz "\nIntroduza um numero: "
str2:	.asciiz "\nConteudo do array:\n"
 	.align 2
lista:	.space SIZE 				# SIZE * 4
	.eqv read_int,5
	.eqv print_str,4
	.eqv print_char,11
	.eqv print_int,1
.text
	.globl main


main:	addi $t0,$t0,SIZE
	addi $t2,$t0,-1				# $t2 = SIZE-1
	la $t6,lista 				# $t6 = lista
	sll $t0,$t0,2				
	addu $t0,$t0,$t6			# $t0 = lista + SIZE*4
	move $t1,$t6				# $t1 = &lista[0]
	
while1:	bge $t1,$t0,endw1			# while(&lista < SIZE) {

 	la $a0,str1
 	li $v0,print_str				
 	syscall					# print_string(...);
 	
 	li $v0,read_int
 	syscall 				# $v0 = read_int();
 	
 	sw $v0,($t1) 				# lista[j] = read_int();
 	addi $t1,$t1,4 				# &lista[++]
 	j while1				# }
endw1:

do: 						# do {
 	li $t4,FALSE 				# houve_troca = FALSE;
 	li $t5,0 				# i = 0;
for: 	bge $t5,$t2,while 			# while(i < SIZE-1){ 
	la $t6,lista 				# $t6 = lista
if: 	sll $t7,$t5,2 				# $t7 = i * 4
 	add $t7,$t7,$t6 			# $t7 = &lista[i]
 	lw $t8,0($t7) 				# $t8 = lista[i]
 	lw $t9,4($t7) 				# $t9 = lista[i+1]
 	ble $t8,$t9,endif 			# if(lista[i] > lista[i+1]){
 	sw $t9,0($t7) 				# lista[i] = $t9
 	sw $t8,4($t7) 				# lista[i+1] = $t8
 	
 	li $t4,TRUE 				# houverTroca = True
						# }
endif: 	addiu $t5,$t5,1				# i++;
 	j for 					# }
while:	beqz $t4,endw 				# } while(houve_troca == TRUE);
	j do
endw:			

		
	addi $t3,$t3,0				# $t3 = j = 0	
	la $a0,str2
 	li $v0,print_str					
 	syscall					# print_string(...);						
for1: 	bge $t3,SIZE,endf1			# for(j = 0; 0<SIZE; j++) {

 	
 		

 	sll $t7,$t3,2 				#
 	addu $t7,$t6,$t7 			# $t7 = &lista[j]
 	lw $a0,($t7) 				# lista[j] = read_int();
 	
 	li $v0,print_int
 	syscall
 	
 	la $a0,';'
 	li $v0,print_char
 	syscall
 	
 	addi $t3,$t3,1 				# j++
 	j for1					# }
endf1:
 	jr $ra 					# termina o programa 
