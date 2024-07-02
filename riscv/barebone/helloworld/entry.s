.global start

.data
	str: .string "Hello World"

.text
start:
  lui t0, 0x10000

	la t1, str # variable *str

	lw t2, 0(t1)
  sw t2, 0(t0)

	lw t2, 1(t1)
  sw t2, 0(t0)

	lw t2, 2(t1)
  sw t2, 0(t0)
	
	lw t2, 3(t1)
  sw t2, 0(t0)

	lw t2, 4(t1)
  sw t2, 0(t0)

	lw t2, 5(t1)
  sw t2, 0(t0)

	lw t2, 6(t1)
  sw t2, 0(t0)

	lw t2, 7(t1)
  sw t2, 0(t0)

	lw t2, 8(t1)
  sw t2, 0(t0)

	lw t2, 9(t1)
  sw t2, 0(t0)

	lw t2, 10(t1)
  sw t2, 0(t0)

  addi t1, zero, '\n'
  sw t1, 0(t0)

	jal halt
	
