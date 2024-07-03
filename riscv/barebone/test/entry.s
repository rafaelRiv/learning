.global start

.data
	str: .string "2+2="

.text
start:
  lui s0, 0x10000

	la s1, str # variable *str
	addi t0, zero, 0 # variable i
	addi t1, zero, 4 # length of str

	j for

	for:
		beq t0,t1, done
		add s2, s1, t0
		lw s3, 0(s2)
  	sw s3, 0(s0)
		addi t0,t0,1 # i++
		j for
	done:

	addi s1, zero,2
	addi s2, zero,2
	add s3, s1, s2
	addi s3, s3, 48
  sw s3, 0(s0)

  addi s1, zero, '\n'
  sw s1, 0(s0)

	jal halt

	
