.data
str: .asciiz "aabcbaa"
n: .word 0

.text

la x5 str	#string address
la x6 n
sub x7 x6 x5
addi x6 x6 -2	#last index of string
addi x7 x7 -1	#x7 has string length
srli x7 x7 1	#x7 divided by 2
addi x8 x0 1	#x8 is ans(1 if palindrome)

loop:
	beq x7 x0 exit
    lb x10 0(x5)
    lb x11 0(x6)
    beq x10 x11 else
    	add x8 x0 x0
    	j exit
    else:
    addi x5 x5 1
    addi x6 x6 -1
    addi x7 x7 -1
    j loop
exit:
#x8 is 1 if palindrome
#x8 is 0 if not palindrome
