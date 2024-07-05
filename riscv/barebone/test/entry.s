.global start

.data
	str: .string "2+2="

.text
start:
	# The stack grows from bottom to top, so we put the stack pointer
	# to the very end of the stack range.
	la sp, _stack_end

	addi t0, zero, 0 # variable i
	addi t1, zero, 4 # length of str

	jal for

	for:
		beq t0,t1, done
		la a0, str # variable *str
		add a0, a0, t0
		jal putChar
		addi t0,t0,1 # i++
		j for
	done:

#	addi s1, zero,2
#	addi s2, zero,2
	
#	add s3, s1, s2
#	add a0, zero,s1
#	jal putChar

  /*addi s1, zero, '\n'
  sw s1, 0(s0) */

	jal halt

# putChar : Char -> IO ()
putChar:
	addi sp, sp, -32
	sw	s0,0(sp)

	# TODO: load this address from a constant in .data
  lui s0, 0x10000
	
	lw a0, 0(a0)
  sw a0, 0(s0)

	lw s0, 0(sp)
  addi sp,sp, 32

	jr ra

# string -> IO ()
#putStrLn:
#	addi sp, sp, -32
#	sw	s0,0(sp)


	

	
