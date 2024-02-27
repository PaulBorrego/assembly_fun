#
# template assembly file
#

#
# area for variables and constants
#
        .data
ask:   .asciiz     "Year: "
is:   .asciiz     "Is a leap year"
isnt:   .asciiz     "Is not a leap year"
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
    la $a0, ask
    syscall                     #display change input prompt

    li $v0, 5
    syscall                     #int input change prompt/read

    addu $t0, $0, $v0           #load year to $t0

    li $t1, 4
    divu $t0, $t1
    mfhi $t2
    bne $t2, $0, Isnt
    
    li $t1, 400
    divu $t0, $t1
    mfhi $t2
    beq $t2, $0, Is
    

    li $t1,100
    divu $t0, $t1  
    mfhi $t2
    beq $t2,$0,Isnt
    
    Is:
        li $v0, 4
        la $a0, is
        syscall
        b Exit
    Isnt:
        li $v0, 4
        la $a0, isnt
        syscall
        b Exit

    Exit:
        li $v0, 10
        syscall

    
#################




#
# codes END here
#

