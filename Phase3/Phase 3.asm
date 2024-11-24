.data
	menu: .asciiz "\nPlease type the number corresponding to the menu item you wish to purchase:\n1) Water ($2)\n2) Snacks($1)\n3) Sandwhiches($5)\n4) Meals($10)\nEnter a value of -1 to exit.\n" #Initializes the text for the menu
	startBal: .asciiz "\nPlease enter the amount of money you're starting with: " #Initializes the text for the starting balance.
	remainBal: .asciiz "\nYour remaining balance is: " #Initializes the text for the remaining balance.
	quantity: .asciiz "\nPlease enter how many you would like to purchase: " #Initializes the text for how many of an item a user would like to purchase.
	errorMessage: .asciiz "\nYou do not have enough remaining balance to complete this transaction." #Error message for if a purchase would cost more than the current remaining balance in the account.
	purchaseComplete: .asciiz "\nYour purchase was completed successfully." #Notifies the user that the purchase was completed successfully.
	amtPurchased: .asciiz "\nYou have purchased this many of this item: " #Initializes the text for how many of an item a user has purchased.
.text

main:
la $a0, startBal #Loads the starting balance question into the a0 register.
li $v0, 4 #Prepares to print a string.
syscall #Prints the string that is held in a0, in this case the starting balance question.

li $v0, 5 #Prepares to accept a float input.
syscall #Accepts and stores the user's input into v0.

move $t6, $v0

j menuSelect #Jumps to the menu select subroutine. (NOTE)not really necessary since the flow of code will always go to menu select anyway

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

#
	water:
		la $a0, quantity
		li $v0, 4
		syscall

		li $v0, 5
		syscall

		add $t2, $zero, $zero
		add $t3, $zero, $v0
		addi $t2, $t2, 2
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

		j menuSelect		#return back to select screen for next input

	snacks:
		la $a0, quantity
		li $v0, 4
		syscall

		li $v0, 5
		syscall

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

		j menuSelect 		#return for next input

	sandwhiches:
		la $a0, quantity
		li $v0, 4
		syscall

		li $v0, 5
		syscall

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

		j menuSelect		#return to for next input

	meals:
		la $a0, quantity
		li $v0, 4
		syscall

		li $v0, 5
		syscall

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

		j menuSelect		#return for next input

#runs when there is an issue with the option selected and the amount left of the users startBal
error: 
	la $a0, errorMessage
	li $v0, 4
	syscall

	j menuSelect

exit:
	la $a0, remainBal
	li $v0, 4
	syscall

	add $a0, $t6, $zero
	li $v0, 2
	syscall
