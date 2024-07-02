all:
	riscv64-unknown-elf-as    -o entry.o entry.s
	riscv64-unknown-elf-as    -o utils.o utils.s
	riscv64-unknown-elf-ld -T linker.ld -nostdlib entry.o utils.o -o kernel.elf

clean:
	rm *.o *.elf

