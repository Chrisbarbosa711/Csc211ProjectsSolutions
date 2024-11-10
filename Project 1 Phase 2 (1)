      .globl main
      .data 
A: .word   0 : 9        # "array" of 9 words to contain the values in array A.
B: .word   0 : 9        # "array" of 9 words to contain the values in array B.
space:.asciiz  "\n"          # space to insert between numbers .
statement: .asciiz  "Array elements sum equals: " #Prints out the statement before the sum is displayed.
      .text
      
main:  
      la   $t0, A           # Loads address of array A.
      li   $t3, 6           # Stores 6 to t3.
      sw   $t3, 0($t0)      # Stores the value of t3, 6, at the address in t0. Essentially A[0] = 6.
      li   $t3, 34          # Stores 34 to t3.
      sw   $t3, 4($t0)      # Stores the value of t3, 34, at the address in t0. Essentially A[1] = 34.
      li   $t3, -7          # Stores -7 to t3.
      sw   $t3, 8($t0)      # Stores the value of t3, -7, at the address in t0. Essentially A[2] = -7.
      li   $t3, 3           # Stores 3 to t3.
      sw   $t3, 12($t0)     # Stores the value of t3, 3, at the address in t0. Essentially A[3] = 3.
      li   $t3, 0           # Stores 0 to t3.
      sw   $t3, 16($t0)     # Stores the value of t3, 0, at the address in t0. Essentially A[4] = 0.
      li   $t3, -20         # Stores -20 to t3.
      sw   $t3, 20($t0)     # Stores the value of t3, -20, at the address in t0. Essentially A[5] = -20.
      li   $t3, 6           # Stores 6 to t3.
      sw   $t3, 24($t0)     # Stores the value of t3, 6, at the address in t0. Essentially A[6] = 6.
      li   $t3, -2          # Stores -2 to t3.
      sw   $t3, 28($t0)     # Stores the value of t3, -2, at the address in t0. Essentially A[7] = -2.
      li   $t3, 10          # Stores 10 to t3.
      sw   $t3, 32($t0)     # Stores the value of t3, 10, at the address in t0. Essentially A[8] = 10.
      
      la   $t1, B           # Loads address of array B.
      li   $t3, 3           # Stores 3 to t3.
      sw   $t3, 0($t1)      # Stores the value of t3, 3, at the address in t0. Essentially B[0] = 3.
      li   $t3, -1          # Stores -1 to t3.
      sw   $t3, 4($t1)      # Stores the value of t3, -1, at the address in t0. Essentially B[1] = -1.
      li   $t3, 2           # Stores 2 to t3.
      sw   $t3, 8($t1)      # Stores the value of t3, 2, at the address in t0. Essentially B[2] = 2.
      li   $t3, -9          # Stores -9 to t3.
      sw   $t3, 12($t1)     # Stores the value of t3, -9, at the address in t0. Essentially B[3] = -9.
      li   $t3, -1          # Stores -1 to t3.
      sw   $t3, 16($t1)     # Stores the value of t3, -1, at the address in t0. Essentially B[4] = -1.
      li   $t3, 4           # Stores 4 to t3.
      sw   $t3, 20($t1)     # Stores the value of t3, 4, at the address in t0. Essentially B[5] = 4.
      li   $t3, 6           # Stores 6 to t3.
      sw   $t3, 24($t1)     # Stores the value of t3, 6, at the address in t0. Essentially B[6] = 6.
      li   $t3, 11          # Stores 11 to t3.
      sw   $t3, 28($t1)     # Stores the value of t3, 11, at the address in t0. Essentially B[7] = 11.
      li   $t3, 4           # Stores 4 to t3.
      sw   $t3, 32($t1)     # Stores the value of t3, 4, at the address in t0. Essentially B[8] = 4.
      
      li $t3, 0 # Sets t3 to 0, in preperation to use it as i in the for statement.
      li $t4, 9 # Sets t3 to 9, in preperation to use it as the stopping point in the for statement.
Loop1: # Acts as the label for the first loop.
      beq $t3, $t4, Exit1 # Acts as the i<9 portion of the for loop. When the condition is met, it moves on to the Exit1 label.
      lw $t5, 0($t0) # Sets t5 to the current value at t0, essentially t5 = A[a]. In other words, initializes a variable, say X and sets it's value to the current value of the Array A at the index a.
      lw $t6, 0($t1) # Sets t6 to the current value at t1, essentially t6 = B[b]. In other words, initializes a variable, say Y and sets it's value to the current value of the Array B at the index b.
      add $t7, $t5, $t6 # Adds t5 to t6 and stores them in a final variable t7. In other words, Z = X + Y.
      sw $t7, 0($t0) # Overwrites the value of t0 with what is stored in t7. Sets the value of the array A at the current current index to the sum of the values we'd added previously. In other words, A[i] = Z.
      addi $t0, $t0, 4 # Increments the memory address stored at t0, essentially increments the earlier index a that we used to figure out where we were in the array A. In other words, a = a + 4. This moves the index of A up 1.
      addi $t1, $t1, 4 # Increments the memory address stored at t0, essentially increments the earlier index b that we used to figure out where we were in the array B. In other words, b = b + 4. This moves the index of B up 1.
      addi $t3, $t3, 1 # Increments t3 by 1. In other words, i = i + 1
      j Loop1 # Jumps back to Loop1, and continues the loop until the beq statement is fulfilled.
Exit1: # Acts as the exit label for the first loop.
      li $t3, 0 # Resets the value of t3 to 0, preparing it to be used as i in the next for statement.
      li $t4, 9 # Resets the value of t4 to 9, preparing it to be used as the stopping point in the next for statement.
      li $t7, 0 # Resets the value of t7, preparing it to be used as the sum variable in the next portion of the code (Summing all of the values up).
      la $t0, A # Resets t0 to the original starting address of array A. Essentially, goes back to A[0].
      la $t1, B # Resets t1 to the original starting address of array B.
Loop2: # Acts as the label for the second loop.
      beq $t3, $t4, Exit2 # Acts as the i<9 portion of the for loop. When the condition is met, it moves on to the Exit2 label.
      lw $t5, 0($t0) # Sets t5 to the current value at t0, essentially t5 = A[a]. In other words, initializes a variable, say X and sets it's value to the current value of the Array A at the index a.
      lw $t6, 0($t1) # Sets t6 to the current value at t1, essentially t6 = B[b]. In other words, initializes a variable, say Y and sets it's value to the current value of the Array B at the index b.
      add $t7, $t7, $t5 # Adds t5 to t7 and stores them in a final variable t7. In other words, sum = sum + X
      add $t7, $t7, $t6 # Adds t6 to t7 and stores them in a final variable t7. In other words, sum = sum + Y
      addi $t0, $t0, 4 # Increments the memory address stored at t0, essentially increments the earlier index a that we used to figure out where we were in the array A. In other words, a = a + 4. This moves the index of A up 1.
      addi $t1, $t1, 4 # Increments the memory address stored at t0, essentially increments the earlier index b that we used to figure out where we were in the array B. In other words, b = b + 4. This moves the index of B up 1.
      addi $t3, $t3, 1 # Increments t3 by 1. In other words, i = i + 1
      addi $t7, $t7, 1 # Increments t7 by 1. In other words, sum = sum + 1
      j Loop2 # Jumps back to Loop2, and continues the loop until the beq statement is fulfilled.
 Exit2: # Acts as the exit label for the second loop.
     li $t3, 0 # Resets the value of t3 to 0, preparing it to be used as i in the next for statement.
     li $t4, 9 # Resets the value of t4 to 9, preparing it to be used as the stopping point in the next for statement.
     la $t0, A # Resets t0 to the original starting address of array A. Essentially, goes back to A[0].
PrintEverything: # Acts as the label for the loop that prints all the numbers in array A.
     beq $t3, $t4, PrintSum # Acts as the i<9 portion of the for loop. When the condition is met, it moves on to the PrintSum label.
     lw $t5, 0($t0) # Sets t5 to the current value at t0, essentially t5 = A[a]. In other words, initializes a variable, say X and sets it's value to the current value of the Array A at the index a.
     la $a0, ($t5) # Sets a0 to the current value at t5. Holds the value and prepares to use it for, in this case, printing the number.
     li $v0, 1 # Sets v0 to 1, which tells the program that we want to print an integer that is stored in a0.
     syscall # Tells the system to perform the functions in the a and v registers. In this case it prints the value held in a0.
     la $a0, space # Sets a0 to the value of space, which in this case is a space.
     li $v0, 4 # Sets v0 to 4, which tells the program that we want to print a string that is stored in a0.
     syscall # Tells the system to perform the functions in the a and v registers. In this case it prints the value held in a0.
     addi $t0, $t0, 4 # Increments the memory address stored at t0, essentially increments the earlier index a that we used to figure out where we were in the array A. In other words, a = a + 4. This moves the index of A up 1.
     addi $t3, $t3, 1 # Increments t3 by 1. In other words, i = i + 1
     j PrintEverything # Jumps back to PrintEverything, and continues the loop until the beq statement is fulfilled.
PrintSum: # Acts as the label for the print statement that prints the Array Elements Sum statement as well as the sum.
     la $a0, statement # Sets a0 to the value of statement, which in this case is the statement 'Array elements sum equals: '.
     li $v0, 4 # Sets v0 to 4, which tells the program that we want to print a string that is stored in a0.
     syscall # Tells the system to perform the functions in the a and v registers. In this case it prints the value held in a0.
     la $a0, ($t7) # Sets a0 to the current value at t7, which is the total sum we computed earlier. Holds the value and prepares to use it for, in this case, printing the number.
     li $v0, 1  # Sets v0 to 1, which tells the program that we want to print an integer that is stored in a0.
     syscall # Tells the system to perform the functions in the a and v registers. In this case it prints the value held in a0.