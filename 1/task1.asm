addi x10, x0, -1

# count bit 1
srl x19, x10, x18 #bring the Nth bit(value of x18 determines N) to first position (less significant bit) by shifting left by N-1 bits (new value is saved on temp x19)
andi x19, x19, 1 #compare it with 1 (as if we are using an "if bit0=1" statement). if the Nth bit is 1, x19 will be equal to 1
add x20, x20, x19 #add that to our counter x20
sub x19, x19, x19 #wipe x19's value so that we use it FRESH on our next bit
addi x18, x18, 1 #increase iterator (bit count)

# count bit 2
srl x19, x10, x18
andi x19, x19, 1
add x20, x20, x19
sub x19, x19, x19
addi x18, x18, 1

# count bit 3
srl x19, x10, x18
andi x19, x19, 1
add x20, x20, x19
sub x19, x19, x19
addi x18, x18, 1