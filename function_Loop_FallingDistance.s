#
# for loop emulation, display #s and show sum
#

#
# area for variables and constants
#
        .data
total:      .float 10.0
ctr:       .float 1.0
one:       .float 1.0
spc:        .asciiz " "
NL:        .asciiz "\n"
tab:        .asciiz "\t"
fpHf: .float 0.5
fpGr: .float 9.8

#
# code text section
#
        .text
        .globl  main
main:

#
# codes START here
#
    l.s $f0, total           #load total count to display
    l.s $f1, ctr            #initialize counter
    l.s $f2, one            #load incrementer
    li $s0, 0               #integer counter
loop:
    c.le.s $f1, $f0
    bc1f exit
    jal fallingDistance
    add.s $f1, $f1, $f2
    b loop                  #else proceed to branch back to body

fallingDistance:
    addi $s0, $s0, 1

    li $v0, 1               #set the print flag to print int value
    add $a0, $0, $s0        #print contents of s0, int counter
    syscall                 #do the print

    li $v0, 4               #set the print flag to print string value
    la $a0, tab            #print ascii contents of spc value
    syscall                 #do the print

    l.s $f3, fpHf
    l.s $f4, fpGr
    mul.s $f3, $f3, $f4     #0.5 * 9.8, 1/2 * g
    mul.s $f5, $f1, $f1     #t * t
    mul.s $f5, $f5, $f3     #0.5 * 9.8 * (t * t)

    li $v0, 2               #set the print flag to print float value
    mov.s $f12, $f5         #print contents of cuurent value in $s2
    syscall                 #do the print

    li $v0, 4               #set the print flag to print string value
    la $a0, NL            #print ascii contents of spc value
    syscall                 #do the print

    jr $ra
    

exit:
    syscall                 #do the print
    li $v0, 10
    syscall

#
# codes END here
#

