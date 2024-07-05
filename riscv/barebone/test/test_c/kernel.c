
void main(void) {
	putChar('t');
}

void putChar(char c) {
	char* UART = 0x10000000;
	*UART=c;
}

