#John Nguyen
#Lab 2 Part 3

.data 

z: .word 2
i: .word 0

.text

main:
	
	lw a0, z		#load z
	lw a1, i		#load i
	
for:	slti a2, a1, 22 	#a2 = 1 if i < 20  
	beq a2, zero, next
	addi a0, a0, 1 		# z++
	addi a1, a1, 2 		#i + 2
	j for
	
	
next: 	
	addi a0, a0, 1 		# z++
	slti a2, a0, 100 	#a2 = 1 if z < 100 
	bne a2, zero, next
	beq a2, zero, while
	
while:  addi a3, zero, 0 	#int for 0
	slt a2, a3, a1 		#a2 = 1 if 0 < i 
	beq a2, zero, exit
	addi a0, a0, -1
	addi a1, a1, -1
	j while
	
exit: 	sw a0, z, a5		#store z
	sw a1, i, a6		#store i