#
# template assembly file
#

#
# area for variables and constants
#
        .data
promptChange:   .asciiz     "Enter Change: "
labelQuarter:   .asciiz     "Quarter: "
labelDime:      .asciiz     "Dime: "
labelNickel:    .asciiz     "Nickel: "
labelPenny:     .asciiz     "Penny: "
NL:         .asciiz   "\n"

#
# code text section
#
        .text
        .globl  main
main:

#
# codes START here
#
    li $v0, 4
    la $a0, promptChange
    syscall                     #display change input prompt

    li $v0, 5
    syscall                     #int input change prompt/read

    addu $t0, $0, $v0           #load change value to $t0

    li $t1, 25                  #load divisor, quarter, 25

    divu $t0, $t1               #determine no. of quarters

    mflo $t1                    #get no. of quarters result

    mfhi $t0                    #get remaining change

    li $v0, 4
    la $a0, labelQuarter
    syscall                     #display Quarter label

    li $v0, 1                   
    addu $a0, $t1, $0
    syscall                     #display Quarter value

    li $v0, 4
    la $a0, NL
    syscall                     #print new line

    li $t1, 10                  #load divisor, dime, 10

    divu $t0, $t1               #determine no. of dimes

    mflo $t1                    #get no. of dimes result

    mfhi $t0                    #get remaining change

    li $v0, 4
    la $a0, labelDime
    syscall                     #display Dime label

    li $v0, 1                   
    addu $a0, $t1, $0
    syscall                     #display Dime value

    li $v0, 4
    la $a0, NL
    syscall                     #print new line

    li $t1, 5                  #load divisor, nickel, 5

    divu $t0, $t1               #determine no. of nickels

    mflo $t1                    #get no. of nickel result

    mfhi $t0                    #get remaining change

    li $v0, 4
    la $a0, labelNickel
    syscall                     #display Nickel label

    li $v0, 1                   
    addu $a0, $t1, $0
    syscall                     #display Nickel value

    li $v0, 4
    la $a0, NL
    syscall                     #print new line

    li $v0, 4
    la $a0, labelPenny
    syscall                     #display Penny label

    li $v0, 1                   
    addu $a0, $t0, $0
    syscall                     #display Penny value

#################

    li $v0, 4
    la $a0, NL
    syscall                     #print new line

    li $v0, 10
    syscall                     #graceful exit



#
# codes END here
#

