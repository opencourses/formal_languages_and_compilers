extern int *fn1(int a, int b, char *c[]);
register int ff;

int fn2() {
  	static unsigned long int k = 1, i;
  	for(i = 0; i < 10; i++) {
		k-1;
	}
}

int main() {
  	char *miovett[] = {"Inverno", "Estate"};
  	while(fn1(2,3, miovett) != 0) {
		ff++;
	}
	return ff;
}
