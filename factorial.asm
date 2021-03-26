.data 

.text 
main: 
 li $a0 , 3 # load 3 into argument register to find factorial of 3
 li $a2, 0 # load 0 into $a2
 j factorial #jump to factorial uncoditionally

factorial:
	sub $sp,8 #create space in the stack qtspim makes space in 4 bit spaces
	sw $ra,4($sp) #save return address to stack
	sw $a0,0($sp) #save value of argument stack
	bgeu $a0,1,L1 #sets bracnh to L1 if $a0 greater than or equal to 1
	add $a2,1 # add 1 to $a2 when this is reached
	add $sp, 8 # pop off the stack
	jr $ra #jump to return posistion
L1: 
	sub $a0,1 #subtract one from argument for factorial
	jal factorial, #factorial #jump to factorial
	lw $a0,0($sp) #load argument at stack pointer
	lw $ra,4($sp) #load return address 
	add $sp,8 #pop off the stack
	mul $a2,$a0,$a2 # do the factorial operation 
	jr $ra # jump to return address