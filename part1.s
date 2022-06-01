#John Nguyen
#Lab 2 Part 1

.data 

z: .word 0

.text

main:
	addi a0, zero, 15 #A
	addi a1, zero, 10 #B
	addi a2, zero, 5 #C
	addi a3, zero, 2 #D
	addi a4, zero, 18 #E
	addi a5, zero, -3 #F
	
	sub a6, a0, a1 #A-B
	mul a7, a2, a3 #C*D
	sub a1, a4, a5 #E-F into a1
	div a0, a0, a2 #A/C into a0
	
	add a2, a6, a7
	add a2, a2, a1
	sub a2, a2, a0   
	
	sw a2, z, s4 #store word
	
