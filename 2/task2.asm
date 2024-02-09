.data
str1:	.asciz	"Enter a number:"
str2:	.asciz	"Sequence of multiples:\n"
str3:	.asciz	"  "

.text
main:
la	a0, str1	# a0 = input message
li	a7, 4		# call code for print_string
ecall			# system call

li	a7, 5		# call code for read_integer
ecall			# system call

mv	t1, a0		# save input n

la	a0, str2	# a0 = sequence message
li	a7, 4		# call code for print_string
ecall	

mv 	t0, zero	# i = 0
print_loop:
beq 	t0, t1, end_loop
mul	a0, t1, t0	# ecalls use a0, so there we shall store our result

li	a7, 1		# call code for print_integer
ecall

la	a0, str3	# a0 = space " "
li	a7, 4		# call code for print_string
ecall

addi t0, t0, 1		# i++
j print_loop
end_loop:	 

li	a7, 10		# call code for exit code 0
ecall			# system call
