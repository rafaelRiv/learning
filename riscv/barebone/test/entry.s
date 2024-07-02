.global start

.data
	str: .string "2+2="

.text
start:
  lui t0, 0x10000

	la t1, str # variable *str
	addi t2, zero, 0 # variable i

	lw t3, 0(t1)
  sw t3, 0(t0)

	lw t3, 1(t1)
  sw t3, 0(t0)

	lw t3, 2(t1)
  sw t3, 0(t0)
	
	lw t3, 3(t1)
  sw t3, 0(t0)

	addi s0, zero,2
	addi s1, zero,2
	add s2, s0, s1
	addi s3, s2, 48
  sw s3, 0(t0)

  addi t1, zero, '\n'
  sw t1, 0(t0)

	jal halt
	
