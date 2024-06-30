.global start

.text
start:
  lui t0, 0x10000

	addi t1, zero, '2'
  sw t1, 0(t0)

  addi t1, zero, '+'
  sw t1, 0(t0)

  addi t1, zero, '2'
  sw t1, 0(t0)

  addi t1, zero, '='
  sw t1, 0(t0)

	addi s0, zero,2
	addi s1, zero,2
	add s2, s0, s1
	addi s3, s2, 48
  sw s3, 0(t0)

  addi t1, zero, '\n'
  sw t1, 0(t0)

	jal halt
	
