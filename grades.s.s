#
# template assembly file
#

#
# area for variables and constants
#
        .data

ag:   .asciiz     "Assignment: "
me:   .asciiz     "Midterm: "
fe:   .asciiz     "Final: "
fp:   .asciiz     "Project: "

aGrade:   .asciiz     "Grade: A"
bGrade:   .asciiz     "Grade: B"
cGrade:   .asciiz     "Grade: C"
dGrade:   .asciiz     "Grade: D"
fail:   .asciiz     "Grade: F"

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
    la $a0, ag
    syscall                     #display change input prompt

    li $v0, 5
    syscall                     #int input change prompt/read

    addu $s0, $0, $v0           #add grade
    
    li $v0, 4
    la $a0, me
    syscall                     #display change input prompt

    li $v0, 5
    syscall                     #int input change prompt/read

    addu $s0, $s0, $v0           #add grade

    li $v0, 4
    la $a0, fe
    syscall                     #display change input prompt

    li $v0, 5
    syscall                     #int input change prompt/read

    addu $s0, $s0, $v0           #add grade

    li $v0, 4
    la $a0, fp
    syscall                     #display change input prompt

    li $v0, 5
    syscall                     #int input change prompt/read

    addu $s0, $s0, $v0           #add grade

    li $t0, 4
    div $s0, $t0

    mflo $t1

    li $t0, 91
    bge $t1,$t0,A

    li $t0,81
    bge $t1,$t0,B

    li $t0,71
    bge $t1,$t0,C
    
    li $t0,61
    bge $t1,$t0,D
    

    Fail:
        li $v0, 4
        la $a0, fail
        syscall
        b Exit

    A:
        li $v0, 4
        la $a0, aGrade
        syscall
        b Exit
    B:
        li $v0, 4
        la $a0, bGrade
        syscall
        b Exit
    C:
        li $v0, 4
        la $a0, cGrade
        syscall
        b Exit
    D:
        li $v0, 4
        la $a0, dGrade
        syscall
        b Exit

    Exit:
        li $v0, 10
        syscall

    
#################




#
# codes END here
#

