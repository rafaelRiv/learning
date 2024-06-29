.global _start
_start:
  lui t0, 0x10000

  addi t1, t1, '2'
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

	# exit
	# Pourquoi ceci termine le programme ?
	lui a1, 0x100
	lui a2, 0x5
	addi a2, a2, 0x555
	sw a2, 0(a1)

.data
helloworld: .string "Hello World\n"
