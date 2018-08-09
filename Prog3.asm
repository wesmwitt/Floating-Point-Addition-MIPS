#Wesley Wittekiend
#Program 3

.data
ArrayA:	.float	0.0, 1.1, 2.2, 3.3, 4.4, 5.5, 6.6, 7.7, 8.8, 9.9
ArrayB:	.float	0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0
ArrayC:	.float	0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
space:	.asciiz " "
	
.text
.globl main

main:
	
la $t0, ArrayA
la $t1, ArrayB
la $t2, ArrayC

li $s0, 0		# $s0 = i = 0
li $s1, 10		# $s1 = length=10

Loop:	
	
l.s $f0, 0($t0)		# $f0 = ArrayA[i]
l.s $f1, 0($t1)		# $f1 = ArrayB[B]
add.s $f2, $f0, $f1	# $f2 = ArrayA[i] + ArrayB[i]
s.s $f2, 0($t2)		# save $f2 into Array C
	
li $v0, 		2 #print ArrayC[i]
l.s $f3, 0($t2)
mov.s $f12, $f3
syscall

li $v0, 4		#print space character
la $a0, space
syscall
	
addi $s0, $s0, 1	# increment i and data addresses of arrays
addi $t0, $t0, 4
addi $t1, $t1, 4
addi $t2, $t2, 4

blt $s0, $s1, Loop 	#loop if i < length

li $v0, 10		#END
syscall
