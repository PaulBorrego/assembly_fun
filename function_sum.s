#
# template assembly file
#

#
# area for variables and constants
#
        .data
NL:     .asciiz   "\n"
prompt1: .asciiz "Enter First Number: "
prompt2: .asciiz "Enter Second Number: "
sumDisplay: .asciiz "Sum is: "
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
    la $a0, prompt1
    syscall

    li $v0, 5
    syscall
    addu $s0, $0, $v0

    li $v0, 4
    la $a0, prompt2
    syscall

    li $v0, 5
    syscall
    addu $s1, $0, $v0

    jal doSum

    li $v0, 4
    la $a0, sumDisplay
    syscall

    li $v0, 1
    addu $a0, $t0, $0
    syscall

    b Exit

    Exit:
        li $v0, 10
        syscall


    doSum:
        addu $t0,$s0,$s1
        jr $ra
    


#
# codes END here
#

