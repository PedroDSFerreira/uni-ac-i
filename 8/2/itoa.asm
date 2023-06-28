# Mapa de registos
# n: $a0 -> $s0
# b: $a1 -> $s1
# s: $a2 -> $s2
# p: $s3
# digit: $t0
# Sub-rotina intermédia

.globl strrev,strcpy

itoa: 	addiu $sp,$sp,-20	# reserva espaço na stack

 	sw $s0,0($sp) 			# guarda registos $sx e $ra
 	sw $s1,4($sp)
 	sw $s2,8($sp)
 	sw $s3,12($sp)
 	sw $ra,16($sp)

 	
 	move $s0,$a0 			# copia n, b e s para registos
	move $s1,$a1			# "callee-saved"
	move $s2,$a2
	move $s3,$s2 			# p = s;

do: 					# do {
	rem $t0,$s0,$s1			# digit = n % b; 
	div $s0,$s0,$s1			# n = n / b;
	move $a0,$t0
	jal toascii
	sw $v0,($s3)			# *p = toascii( digit )
	addiu $s3,$s3,1			# p++
 	 				#
while: 	blez $s0,endw 			# } while(n > 0);
	j do
endw:
 	sb $0,0($s3) 			# *p = 0;
	
	move $a0,$s2
 	jal strrev 			# strrev( s );
 	move $v0,$s2			# return s;

 	lw $s0,0($sp) 			# repõe registos $sx e $ra
 	lw $s1,4($sp)
 	lw $s2,8($sp)
 	lw $s3,12($sp)
 	lw $ra,16($sp)
 	addiu $sp,$sp,20 		# liberta espaço na stack
 	
 	jr $ra				# 