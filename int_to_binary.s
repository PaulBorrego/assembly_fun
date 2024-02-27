#
# template assembly file
#

#
# area for variables and constants
#
        .data
NL:     .asciiz   "\n"
prompt: .asciiz "Integer: "
End:    .asciiz "END"
#
# code text section
#
        .text
        .globl  main
main:

    li $s1, 1 #holds value 1
    li $t2, 2 #holds 2
    li $t3, 10 #holds 10
    li $t4, -1 #exit param

#
# codes START here
#
    Start:
        li $v0, 4
        la $a0, prompt
        syscall

        li $v0, 5
        syscall

        beq $v0, $t4, Exit

        addu $t0, $v0, $0   #$t0 has int
        li $s0, 0 #Reset answaer to 0

        li $t1, 2 #holds higheset two value :: 2's power
        b Get_max_2


    Get_max_2:
        bgt $t1,$t0, Transitional #check if $t1 is bigger
        multu $t1,$t2
        mflo $t1
        b Get_max_2

    Transitional:
        div $t1, $t2
        mflo $t1
        b Int_to_bin

    Int_to_bin:
        beq $t1,$s1,Print     #ckeck if val == 1

        jal Add_value       #Adds Binary
        
        multu $s0, $t3      #pushes for next val
        mflo $s0
        
        div $t1, $t2        #moves the 2's power down
        mflo $t1

        b Int_to_bin

    Add_value:
        bge $t0, $t1, Add_one   #If greater than 2's power than add one
        jr $ra                  #jumps back

    Add_one:
        addu $s0, $s0, $s1      #adds one to answer
        sub $t0, $t0, $t1
        jr $ra                  #jumps back

    Print:
        jal Add_value

        li $v0,1
        addu $a0,$s0,$0
        syscall

        li $v0,4
        la $a0, NL
        syscall

        b Start

    
    Exit:
        li $v0,4
        la $a0, End
        syscall

        li $v0, 10
        syscall
         




#
# codes END here
#

