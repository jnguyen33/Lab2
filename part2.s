#John Nguyen
#Lab 2 Part 2

.data
A:	.word 15	# A = 10
B:	.word 15        # B = 15
C:	.word 10	# C = 6
Z:	.word 0		# Z = 0

.text

main:
	lw	a1, A
	lw	a2, B
	lw	a3, C
	addi	t0, zero, 5		# t1 = 5
	addi	t1, zero, 7		# t2 = 7
	addi	t2, zero, 3		# t3 = 3
	
	# if 
	slt	a5, a1, a2		# a5 = (A < B)
	slt	a6, t0, a3		# a6 = (5 < C)
	
	add	a5, a5, a6		# a5 = a5 + a6; = 2 if both true
	addi	a6, zero, 2		# set a6 to 2
	
	beq	a5, a6, First_if	# jump to first if ((A < B) && C > 5))
	
	# else if 
	slt	a5, a2, a1		# a5 = (B < A)
	bne	a5, zero, Second_if	
	addi	a6, a3, 1		# a6 = C + 1
	beq	a6, t1, Second_if	# (a6 == 7) 
	# else
	sw	t2, Z, t1		
	j	Return_if
	
# if Branches
First_if:
	addi    a5, a5, -1             
	sw	a5, Z, t1		
	j	Return_if

Second_if:
	addi	a0, zero, 2
	sw	a0, Z, t1
	j	Return_if
	
Return_if:
	lw	a1, Z
	
	# case 1
	addi	t0, zero, 1		# Storing 1 into x4
	beq	a1, t0, Case_1		# check if Z == 1, branch to Case_1

	# case 2
	addi	t0, zero, 2		# Storing 2 into x4
	beq	a1, t0, Case_2		# Check if Z == 2, branch to Case_2
	
	# case 3
	addi	t0, zero, 3		# Storing 3 into x4
	beq	a1, t0, Case_3		# Check if Z == 3, branch to Case_3
	
	# default
	sw	zero, Z, t1
	j	exit

Case_1:
	addi	t0, zero, -1
	sw	t0, Z, t1
	j	exit

Case_2:
	addi	t0, zero, -2
	sw	t0, Z, t1
	j	exit
	
Case_3:
	addi	t0, zero, -3
	sw	t0, Z, t1
	j	exit
	
exit: