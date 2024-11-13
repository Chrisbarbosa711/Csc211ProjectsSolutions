#deal with the string, \n
.globl main
.data 
sumMessage: .asciiz "The sum value is: "
newline: .asciiz "\n"
A: .word 0 : 5 #Array of 5 words to contain the values in array A
.text 
main:
la   $t0, A           # Loads address of array A.
li   $t3, 1           # Stores 6 to t3.
sw   $t3, 0($t0)      # Stores the value of t3, 6, at the address in t0. Essentially A[0] = 6.
li   $t3, 2           # Stores 34 to t3.
sw   $t3, 4($t0)      # Stores the value of t3, 34, at the address in t0. Essentially A[1] = 34.
li   $t3, 3           # Stores -7 to t3.
sw   $t3, 8($t0)      # Stores the value of t3, -7, at the address in t0. Essentially A[2] = -7.
li   $t3, 4           # Stores 3 to t3.
sw   $t3, 12($t0)     # Stores the value of t3, 3, at the address in t0. Essentially A[3] = 3.
li   $t3, 5           # Stores 0 to t3.
sw   $t3, 16($t0)     # Stores the value of t3, 0, at the address in t0. Essentially A[4] = 0.
addi $t1, $zero, 0 #the sum variable
addi $t2, $zero, 0 #iterator for print
addi $t3, $zero, 5 #ending number
jal Loop1 #print out the original array
addi $t2, $zero, 0 #iterator for print
la $t0, A #resets t0 so we can pass it to the next loop
j Summation_3
Cont:
addi $t2, $zero, 0 #iterator for print
la $t0, A
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
      syscall #prints the integer
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
