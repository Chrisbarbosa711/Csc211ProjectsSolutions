#deal with the string, \n
.globl main
.data 
sumMessage: .asciiz “The sum value is:”
newline: .asciiz "\n"
.text 
main:
addi $t0, $zero, 5000 #storing the array in a continuous block of memory
addi $t1, $zero, 5004
addi $t2, $zero, 5008
addi $t3, $zero, 5012
addi $t4, $zero, 5016
#initializing the values of A[5] 
addi $t5, $zero, 1
addi $t6, $zero, 2
sw $t5, 0($t0) # store 1 in DM[5000]
sw $t6, 0($t1) # store 2 in DM[5004]
addi $t5, $zero, 3 #overwriting the stored value so that we can use the registers over and over
addi $t6, $zero, 4
sw $t5, 0($t2) # store 3 in DM[5008]
sw $t6, 0($t3) # store 4 in DM[5012]
addi $t5, $zero, 5 
sw $t5, 0($t4) # store 5 in DM[5016] 
#now the entire array values are stored in 5000-5016
addi $t1, $zero, 0 #the sum variable
addi $t2, $zero, 0 #iterator for print
addi $t3, $zero, 5 #ending number
jal Loop1 #print out the original array
addi $t2, $zero, 0 #iterator for print
addi $t0, $zero, 5000 #resets t0 so we can pass it to the next loop
j Summation_3
Cont:
addi $t2, $zero, 0 #iterator for print
addi $t0, $zero, 5000
jal Loop1
la $a0, sumMessage #store the sumMessage string in a0
li $v0, 4 #tells the system we want to print a string
syscall #prints the string
la $a0, ($t1) #loads the value of sum in the register a0
li $v0, 1 #tells system we want to print an integer
syscall #prints it
j End #jumps to end the program

Loop1:
      beq $t2, $t3, El #when $t2 originally 0 passes 5 we exit
      lw $t5, 0($t0) #load the value of the element into register $t5
      la $a0, ($t5) #load the element into a0 for printing
      li $v0, 1 #tells the system that we are going to print an integer
      syscall prints the integer
      la $a0, newline #loads the newline string into a0
      li $v0, 4 #tells the system that we are going to print a string
      syscall #prints the string
      addi $t0, $t0, 4 #increses the memory address for the next element
      addi $t2, $t2, 1 # i += 1
      j Loop1

El:
	jr $ra

Summation_3:
      beq $t2, $t3, Cont 
      lw $t5, 0($t0) #load the element of A to register t5
      addi $t5, $t5, 3 #A[i] += 3
      sw $t5, 0($t0) #store the altered value back into the memory address 
      addi $t0, $t0, 4 #increase the memory address to the next element
      addi $t1, $t1, 3 #increase the sum += 3
      addi $t2, $t2, 1 # increase the iterator for the loop
      j Summation_3 
      
End:
