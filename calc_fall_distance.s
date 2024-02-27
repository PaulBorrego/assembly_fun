#
# template assembly file
#

#
# area for variables and constants
#
        .data
NL:     .asciiz   "\n"
fpGr: .float 9.8
fpHf: .float 0.5
one:  .float 1.0

#
# code text section
#
        .text
        .globl  main
main:

#
# codes START here
#
    l.s $f0, total
    l.s $f1, ctr
    l.s $f2, one
    li $s0, 0


#
# codes END here
#

