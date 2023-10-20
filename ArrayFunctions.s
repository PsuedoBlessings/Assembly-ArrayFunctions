.data
Array: .word 11, 12, -10, 13, 9, 12, 14, 15, -20, 0
length: .word 10
max: .word 0
sum: .word 0

.text
.globl main
main:

    la $t0, Array  # address of Array
    lw $t1, length # storing the legnth of the array
    la $t2, max # the highest value within the array
    la $t3, sum  # total that each element adeed together make
    li $t4, 0	# $t4 = 0 | representing i for loop index
    jal		sumLoop				# jump to sumLoop and save position to $ra
    jal		maxLoop				# jump to maxLoop and save position to $ra

    lw $t2, max # storing the int max
    lw $t3, sum  # storing the int sum

    li		$v0, 1		# $v0 = 1 
    move 	$a0, $t2		# $a0 = $t2
    syscall

    li		$v0, 1		# $v0 = 1 
    move 	$a0, $t3		# $a0 = $t3
    syscall

    li $v0, 10
    syscall
   
    sumLoop:
        lw		$t5, ($t0) #loading the 0th position for Array 
        add		$t6, $t6, $t4	# $t6 = $t6 + $t4
        add		&t4, $t4, 1	# incrememnting the i in our loop
        add     $t0, $t0, 4 # updating the address

        blt		$t4, $t1, sumLoop	# if $t4 < $t1 then sumLoop

        move	$t6, $t3 # saving to sum

    #------- setting the values or default back to zero ---------
        la $t0, Array  # address of Array
        lw $t1, length # storing the legnth of the address
        li $t4, 0	# reseting i index
        li $t5, 0	# $t5 = 0
        li $t6, 0	# $t6 = 0
    #------------------- end of function -------------------
        jr		$ra					# jumps back to main
        

     maxLoop:
        lw		$t5, ($t0) #loading the nth position for Array
        add		&t4, $t4, 1	# incrememnting the i in our loop
        add     $t0, $t0, 4 # updating the address
        bgt		$t5, $t2, isBigger	# if $t5 > $t1 then goto isBigger
        blt		$t4, $t1, maxLoop	# if $t4 < $t1 then maxLoop
        #------- setting the values or default back to zero ---------
        la $t0, Array  # address of Array
        lw $t1, length # storing the legnth of the address
        li $t4, 0	# reseting i index
        li $t5, 0	# $t5 = 0
        li $t6, 0	# $t6 = 0
        #------------------- end of function -------------------
        jr		$ra					# jumps back to main
        

        isBigger: # the position of $t5 is bigger than what's stored in $t2 (max)
            move 	$t2, $t5		# $t2 = $t5 whatever is inside $t5 is the new max
            jr		$ra				# jumps back to maxLoop at line 57
            
        
        

        
    


        
