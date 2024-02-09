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
addi	sp, sp, -16	# increase stack pointer by 3 elements / we don't need to save ra anymnore
sw 	a0, 12(sp) 	# save start address of 2d array
sw 	a1, 8(sp)
sw 	a3, 4(sp)
sw	s1, 0(sp)	# save s1
			
li 	s1, 0		# int i = 0

start_rs:
beq	s1, a2, end_rs	# for (i=0; i<rows; i++)

li 	t0, 0		# sum = 0
slli 	a1, a1, 2 	# size of a single row
add	a1, a1, a0	
start_sum:
beq 	a0, a1, end_sum					
lw 	t1, 0(a0) 	# load element
add 	t0, t0, t1 	# add to sum
addi 	a0, a0, 4	# next array address
j start_sum
end_sum:
sw	t0, 0(a3)	#opws kai prin 			
addi	a3, a3, 4				        
mv 	a0, a1
lw 	a1, cols

addi	s1, s1, 1	# i++
j start_rs

end_rs:	
lw	a0, 12(sp) 	
lw 	a1, 8(sp)
lw 	a3, 4(sp)
lw	s1, 0(sp)
addi	sp, sp, 16		
jr	ra

end_program:

#genika glutwsame ta lw sw ra, ts jr ra kai ta mv ths end_sum - oso perissoteres grammes tha xame toso xeirotero tha tan me thn en8eth (dhl oso megalutero i)