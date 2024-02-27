    .data
prompt: .asciiz "Integer: "

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
    la $a0, prompt
    syscall

    li $v0, 5
    syscall

    addu $t0, $v0, $0   #$t0 has int

    li $v0, 1
    addu $a0,$t0,$0
    syscall

    li $v0, 10
    syscall
