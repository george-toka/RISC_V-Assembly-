#initialise x10,x11
addi x10, x0, -254 
addi x11, x0, 20

#serves as the size (in bits) of our registers
addi x12, x0, 32

sll x19, x10, x11 #shift our number left as asked
sub x13, x12, x11 #x13 serves as x11's complementary shift value 
srl x20, x10, x13 #shift our number opposite with our complemntary shift value, so that our right missinng part for the rotation to be completed, appears on a different register
add x10, x19, x20 #simply add our left part and right part to create the effect of rotation