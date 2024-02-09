.data 	# data memory
rows:	.word	2
cols:	.word	3
array2d:
	.word	342	# array[0][0]
	.word	654	# array[0][1]
	.word	263	# array[0][2]
	.word	463	# array[1][0]
	.word	975	# array[1][1]
	.word	378	# array[1][2]
rows_sum:
	.word 0
	.word 0

.text 	# program memory
main:
# pass arguments to function call:
la	a0, array2d 		# arg0 = input array address
lw	a1, cols			# arg1 = number of columns
lw	a2, rows			# arg2 = number of rows
la	a3, rows_sum		# arg3 = output array address
jal	ra, compute_row_sum	# function call
j	end_program

compute_row_sum:
# a0 = start address of 2d array
# a1 = number of columns
# a2 = number of rows
# a3 = start address of results array
addi	sp, sp, -12	# increase stack pointer by 3 elements
sw	ra, 8(sp)		# save return address
sw	a0, 4(sp)		# save start address of 2d array
sw	a1, 0(sp)		# save number of columns
slli	s0, a1, 2		# size of a single row
li 	s1, 0			# int i = 0
start_rs:
beq	s1, a2, end_rs	# for (i=0; i<rows; i++)
# pass arguments to function call:
# arg0 = array address
# arg1 = array size
jal	ra, compute_sum	# helper function call
# function return value @ arg0 (a0)
####### missing code #######

sw 	a0, 0(a3) #save sum on the i-th position of rows_sum
addi 	a3, a3, 4 #so that in the next loop our NEXT sum is saved in the position of rows_sum
mv 	a0, a1   #h timh tou a0=a1 sto telos tou start_rs, pou shmainei to a0 eftase sto telos ths prwths grammhs ara sthn arxh ths deyterhs (dhl a1 = dieu8unsh toy 1ou stoixeiou ths 2hs grammhs)
lw 	a1, cols #refresh the a1 parameter because it changes during start_sum

####### missing code #######
addi	s1, s1, 1		# i++
j start_rs
end_rs:
lw	ra, 8(sp)		# restore return address
addi	sp, sp, 12		# decrease stack pointer by 3 elements
jr	ra

compute_sum:
# a0 = start address of array
# a1 = size
li	t0, 0			# sum = 0
slli	a1, a1, 2		# array size in bytes
add	a1, a0, a1		# end address of array
start_sum:
beq	a0, a1, end_sum
lw	t1, 0(a0)		# load element
add	t0, t0, t1		# add to sum
addi	a0, a0, 4		# next array address
j	start_sum
end_sum:
mv	a0, t0		# return sum @ a0
jr	ra

end_program:

#telikes times 1259,1816
