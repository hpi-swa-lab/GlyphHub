#include <windows.h>
#include <errno.h>
#include <malloc.h>

#include "sq.h"

#include "Fibonacci.h"

sqInt fib(sqInt num) {
	sqInt a = 1;
	sqInt b = 1;
	sqInt tmp = 0;

	for (sqInt i = 3; i <= num; i++) {
		tmp = a;
		a = a + b; 
		b = tmp;
	}

	return a;
}

sqInt fibRec(sqInt num) {
	if (num <= 2) {
		return 1;
	}
	else {
		return fibRec(num - 1) + fibRec(num - 2);
	}
}
