#John Nguyen
#Lab 2 Part 5

.data 

a: .word 0
b: .word 0
c: .word 0

.text

main:	addi t0, zero, 5 	#i = 5
	addi t1, zero, 10 	#j = 10
	
	addi sp, sp, -8
	sw t0, 0(sp)
	sw t1, 4(sp)
	jal AddItUp
	add a0, zero, t1 	#a = x
	lw t1, 4(sp) 		# load j = 10 into t1
	sw t1, 0(sp)
	jal AddItUp
	add a1, zero, t1 	#b = x
	add a2, a0, a1  	# c = a + b
	sw a0, a, t6
	sw a1, b, t6
	sw a2, c, t6
	addi a4, zero, 27
	j exit
	
AddItUp:lw s0, 0(sp)
	add a3, zero, s0 	#set int n
	
	addi t0, zero, 0 	#i = 0
	addi t1, zero, 0 	#x = 0
	j for

for: 	slt a5, t0, a3  	#a5 = 1 if i < n 
	beq a5, zero, next
	addi t1, t1, 1 		# x+1
	add t1, t1, t0 		#(x+1) + i
	addi t0, t0, 1 		#i++
	j for
	
next: 	jr ra
exit:	addi sp, sp, 12 	# Shrink stack up by 12 bytes prevent memory leak