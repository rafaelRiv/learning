.global start

.data
	str: .string "Hello World"

.text
start:
	# The stack grows from bottom to top, so we put the stack pointer
	# to the very end of the stack range.
	la sp, _stack_end

	la a0, str
	jal putStrLn

	jal halt

# putChar : Char -> IO ()
putChar:
	addi sp, sp, -4
	sw	s0,0(sp)

	# TODO: load this address from a constant in .data
  lui s0, 0x10000

  sw a0, 0(s0)

	lw s0, 0(sp)
  addi sp,sp, 4

	jr ra

# string -> IO ()
putStrLn:
	addi sp, sp, -8
	sw	s0,4(sp)
	sw	ra,0(sp)

	add s0, zero, a0

	lw t0, 0(s0)
	addi t1, zero, 0

	beq t0,t1, donePutStrLn
	
	add a0, zero, t0
	jal putChar

	addi a0, s0, 1

	jal putStrLn

	lw s0, 4(sp)
	lw ra, 0(sp)
  addi sp,sp, 8

	jr ra

	donePutStrLn:
		addi a0, zero, '\n'
		jal putChar

		lw s0, 4(sp)
		lw ra, 0(sp)
  	addi sp,sp, 8

		jr ra

