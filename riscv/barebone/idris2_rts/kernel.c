
typedef struct {
  int refCounter;
  int tag; 
} Value_header;

void main(void) {
	Value_header idris2_string;
	idris2_string.refCounter=0;
	idris2_string.tag = 1;
}

