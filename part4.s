#John Nguyen
#Part 4

.data
A:	.space 20 # int A[5];
B:	.word 1, 2, 4, 8, 16 # int B[5] = {1,2,4,8,16};

.text
main:
	add	t0, zero, zero	# int i
	addi	t1, zero, 5	# int 5;
	la	t5, A		# store A[0] address
	la	t6, B		# store B[0] address
For_loop:	
	bge	t0, t1, While_loop	# if i >= , branch to Exit
	slli	t3, t0, 2	# t2 is offset by 4
	add	t2, t3, t6	# address of B[i] in t2
	lw	t2, (t2)	# Load B[i] value
	addi	t2, t2, -1	# B[i] - 1
	
	add	t4, t3, t5	# store A[i]
	sw	t2, (t4)	
	addi	t0, t0, 1	# i++
	j	For_loop	# restart loop

While_loop:
	addi	t0, t0, -1	# i--
	blez	t0, Exit
	slli	t3, t0, 2	# t3 is offset by 4
	
	add	t2, t3, t6	# address B[i]
	lw	t2, (t2)	# B[i] value
	
	add	t4, t3, t5	# A[i] address
	lw	t1, (t4)	# A[i] value
	
	add	t2, t2, t1	# A[i] + B[i]
	add	t2, t2, t2	# *= 2
	
	sw 	t2, (t4)	#store A[i]
	j	While_loop
Exit: