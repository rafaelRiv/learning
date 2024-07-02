.global halt

halt:
	# Pourquoi ceci termine le programme ?
	lui a1, 0x100
	lui a2, 0x5
	addi a2, a2, 0x555
	sw a2, 0(a1)
	jr ra
