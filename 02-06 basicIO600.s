#
# area for variables and constants
#
        .data
vX: .word   100
strLen:   .asciiz     "Enter Length: "
strHei:   .asciiz     "Enter Height: "
strArea:   .asciiz     "Area: "
strPerim: .asciiz     "\nPerimeter: "  

#
# template assembly file
#
        .text
        .globl  main
main:
#
# opening linkage (save return address)
#
        addi    $sp, $sp, -4
        sw      $ra, 0($sp)
#
# codes START here
#
        #display hello string
       li $v0, 4
       la $a0, strLen
       syscall

        #input a value
       li $v0, 5
       syscall

       #move $v0 to register $t0
       addu $t1, $v0, $0


       #display enter number string
       li $v0, 4
       la $a0, strHei
       syscall

       #input a value
       li $v0, 5
       syscall

       #move $v0 to register $t0
       addu $t0, $v0, $0

        #set perim
        addu $t3,$t0,$t1
        addu $t3,$t3,$t3

        #set area
        multu $t0,$t1
        mflo $t4

       #display enter number string
       li $v0, 4
       la $a0, strArea
       syscall

       #display Area label
       li $v0, 1
       addu $a0 $t4, $0
       syscall

       #display Perim label
       li $v0, 4
       la $a0, strPerim
       syscall

       #print int, sum
       li $v0, 1
       addu $a0, $t3, $0
       syscall




#
# codes END here
#

#
# closing linkage (get return address and restore stack pointer)
#
        lw      $ra, 0($sp)
        addi    $sp, $sp, 4
        jr      $ra
        .end    main

