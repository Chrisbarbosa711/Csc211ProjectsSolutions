.data
	menu: .asciiz "\nPlease type the number corresponding to the menu item you wish to purchase:\n1) Water ($2)\n2) Snacks($1)\n3) Sandwhiches($5)\n4) Meals($10)\nEnter a value of -1 to exit.\n" 		#Initializes the text for the menu
	startBal: .asciiz "\nPlease enter the amount of money you're starting with: " 		#Initializes the text for the starting balance.
	remainBal: .asciiz "\nYour remaining balance is: " 	#Initializes the text for the remaining balance.
	quantity: .asciiz "\nPlease enter how many you would like to purchase: " 	#Initializes the text for how many of an item a user would like to purchase.
	errorMessage: .asciiz "\nYou do not have enough remaining balance to complete this transaction." #Error message for if a purchase would cost more than the current remaining balance in the account.
	purchaseComplete: .asciiz "\nYour purchase was completed successfully." 	#Notifies the user that the purchase was completed successfully.
	amtPurchased: .asciiz "\nYou have purchased this many of this item: " 		#Initializes the text for how many of an item a user has purchased.
	negAmount: .asciiz "invalid option amount entered."		#If the user enters a number not valid(negative) for the options quantity
	invalidAmount: .asciiz "you entered 0 or a negative number for the starting amount"
.text

main:
la $a0, startBal 		#Loads the starting balance question into the a0 register.
li $v0, 4 			#Prepares to print a string.
syscall 			#Prints the string that is held in a0, in this case the starting balance question.

#(NOTE) is possible that they enter 0 or a negative here as well, need to add a fix to avoid that
li $v0, 5 			#Prepares to accept a integer input.
syscall 			#Accepts and stores the user's input into v0.

move $t6, $v0			#We move the users input to the register $t6
slt $at, $zero, $t6		#If 0 < our amount then we are good, if not then we branch
beq $at, $zero, error3		#If $t6 <= 0 then the above is not true and $at = 0 

j menuSelect #Jumps to the menu select subroutine. 
#(NOTE) Not really necessary since the flow of code will always go to menu select anyway(at this point)

menuSelect:
	la $a0, menu 		#Loads the menu into the a0 register.
	li $v0, 4 		#Prepares to print a string.
	syscall 		#Prints the string that is held in a0, in this case menu.

	li $v0, 5 		#Prepares to accept a user's inputted menu choice.
	syscall 		#Accepts and stores the user's input into v0.

	la $t0, ($v0) 		#Stores the selected menu option into t0.

# the following parses the input and jumps to the different options based on the user input, represented here as beq statements
	beq $t0, -1, exit 	#If the user input is -1, which is the exit code, jumps to the exit subroutine.
	beq $t0, 1, water 	#If the user input is 1, which is the water option, jumps to the water subroutine.
	beq $t0, 2, snacks 	#If the user input is 2, which is the snacks option, jumps to the snacks subroutine.
	beq $t0, 3, sandwhiches #If the user input is 3, which is the sandwhiches, jumps to the sandwhiches subroutine.
	beq $t0, 4, meals 	#If the user input is 4, which is the meals option, jumps to the meals subroutine.
	j menuSelect		#If they enter an input which does not match any of the above option just run the menuSelect again

#(NOTE) added the invalid qaunity code to this option, if works correctly add to all options
	water:
		la $a0, quantity		#Load the quantity string into $a0 for printing
		li $v0, 4
		syscall

		li $v0, 5			#Setup the system to take the quanity amount as input
		syscall
#Must make sure the input is not invalid or negative
		slt $at, $zero, $v0		#If the value in $v0 is < 0 then the following is false and $at is 0
		beq $at, $zero, error2		#If so, then we branch to the following
#If $v0, is greater than or equal to 0, then the normal flow occurs and goes to the next line

		add $t2, $zero, $zero  
		add $t3, $zero, $v0		#Store the amount of the option they want in $t3
		addi $t2, $t2, 2		#Water costs $2 
		mul $t1, $t2, $t3		#Scale the cost with the amount they purchases 

		slt $at, $t6, $t1		#If the total amount they purchase surpasses there current amount jump
		bne $at, $zero, error		#to error

		sub $t6, $t6, $t1 		#If no issues, subtract from the total 

#The following is purely arbitrary we output: the purchase was successful, the amount of the item they purchased, 
#the total after the purchase
		la $a0, purchaseComplete	
		li $v0, 4
		syscall

		la $a0, amtPurchased
		li $v0, 4
		syscall

		la $a0, ($t3)
		li $v0, 1
		syscall

		la $a0, remainBal
		li $v0, 4
		syscall

		la $a0, ($t6)
		li $v0, 1
		syscall

		j menuSelect			#Return back to select screen for next input

#All remaining option follow the same logic as the water option
	snacks:
		la $a0, quantity
		li $v0, 4
		syscall

		li $v0, 5
		syscall
		slt $at, $zero, $v0		#If the value in $v0 is < 0 then the following is false and $at is 0
		beq $at, $zero, error2		#If so, then we branch to the following

		add $t2, $zero, $zero
		add $t3, $zero, $v0
		addi $t2, $t2, 1
		mul $t1, $t2, $t3

		slt $at, $t6, $t1
		bne $at, $zero, error

		sub $t6, $t6, $t1

		la $a0, purchaseComplete
		li $v0, 4
		syscall

		la $a0, amtPurchased
		li $v0, 4
		syscall

		la $a0, ($t3)
		li $v0, 1
		syscall

		la $a0, remainBal
		li $v0, 4
		syscall

		la $a0, ($t6)
		li $v0, 1
		syscall

		j menuSelect 			#Return for next input

	sandwhiches:
		la $a0, quantity
		li $v0, 4
		syscall

		li $v0, 5
		syscall
		slt $at, $zero, $v0		#If the value in $v0 is < 0 then the following is false and $at is 0
		beq $at, $zero, error2		#If so, then we branch to the following

		add $t2, $zero, $zero
		add $t3, $zero, $v0
		addi $t2, $t2, 5
		mul $t1, $t2, $t3

		slt $at, $t6, $t1
		bne $at, $zero, error

		sub $t6, $t6, $t1

		la $a0, purchaseComplete
		li $v0, 4
		syscall

		la $a0, amtPurchased
		li $v0, 4
		syscall

		la $a0, ($t3)
		li $v0, 1
		syscall

		la $a0, remainBal
		li $v0, 4
		syscall

		la $a0, ($t6)
		li $v0, 1
		syscall

		j menuSelect			#Return to for next input

	meals:
		la $a0, quantity
		li $v0, 4
		syscall

		li $v0, 5
		syscall
		slt $at, $zero, $v0		#If the value in $v0 is < 0 then the following is false and $at is 0
		beq $at, $zero, error2		#If so, then we branch to the following

		add $t2, $zero, $zero
		add $t3, $zero, $v0
		addi $t2, $t2, 10
		mul $t1, $t2, $t3

		slt $at, $t6, $t1
		bne $at, $zero, error

		sub $t6, $t6, $t1

		la $a0, purchaseComplete
		li $v0, 4
		syscall

		la $a0, amtPurchased
		li $v0, 4
		syscall

		la $a0, ($t3)
		li $v0, 1
		syscall

		la $a0, remainBal
		li $v0, 4
		syscall

		la $a0, ($t6)
		li $v0, 1
		syscall

		j menuSelect			#Return for next input

#Runs when there is an issue with the option selected and the amount left of the users startBal
error: 
	la $a0, errorMessage
	li $v0, 4
	syscall

	j menuSelect

# The following only runs when the user has entered an invalid input to the quantity question
error2:
	la $a0, negAmount
	li $v0, 4
	syscall

	j menuSelect

error3:
	la $a0, invalidAmount
	li $v0, 4
	syscall

	j main			#We jump back to main so that they can enter a new and valid amount

exit:
	la $a0, remainBal 
	li $v0, 4
	syscall			#Print out the remaining balance message

	add $a0, $t6, $zero
	li $v0, 1		
				
	syscall			#Output the remaining balance value 
