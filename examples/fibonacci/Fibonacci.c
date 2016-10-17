/* Automatically generated from Squeak on {17 October 2016 . 6:41:07 pm} */

static char __buildInfo[] = "Generated on {17 October 2016 . 6:41:07 pm}. Compiled on "__DATE__ ;



#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

/* Default EXPORT macro that does nothing (see comment in sq.h): */
#define EXPORT(returnType) returnType

/* Do not include the entire sq.h file but just those parts needed. */
#include "sqConfig.h"			/* Configuration options */
#include "sqVirtualMachine.h"	/*  The virtual machine proxy definition */
#include "sqPlatformSpecific.h"	/* Platform specific definitions */

#define true 1
#define false 0
#define null 0  /* using 'null' because nil is predefined in Think C */
#ifdef SQUEAK_BUILTIN_PLUGIN
# undef EXPORT
# define EXPORT(returnType) static returnType
#endif

#include "Fibonacci.h"
#include "sqMemoryAccess.h"


/*** Function Prototypes ***/
EXPORT(const char*) getModuleName(void);
EXPORT(sqInt) primitiveFib(void);
EXPORT(sqInt) primitiveFibRec(void);
EXPORT(sqInt) setInterpreter(struct VirtualMachine*anInterpreter);


/*** Variables ***/

#if !defined(SQUEAK_BUILTIN_PLUGIN)
static sqInt (*failed)(void);
static sqInt (*integerObjectOf)(sqInt value);
static sqInt (*methodArgumentCount)(void);
static sqInt (*popthenPush)(sqInt nItems, sqInt oop);
static sqInt (*primitiveFailFor)(sqInt reasonCode);
static sqInt (*stackIntegerValue)(sqInt offset);
#else /* !defined(SQUEAK_BUILTIN_PLUGIN) */
extern sqInt failed(void);
extern sqInt integerObjectOf(sqInt value);
extern sqInt methodArgumentCount(void);
extern sqInt popthenPush(sqInt nItems, sqInt oop);
extern sqInt primitiveFailFor(sqInt reasonCode);
extern sqInt stackIntegerValue(sqInt offset);
extern
#endif
struct VirtualMachine* interpreterProxy;
static const char *moduleName =
#ifdef SQUEAK_BUILTIN_PLUGIN
	"Fibonacci 17 October 2016 (i)"
#else
	"Fibonacci 17 October 2016 (e)"
#endif
;



/*	Note: This is hardcoded so it can be run from Squeak.
	The module name is used for validating a module *after*
	it is loaded to check if it does really contain the module
	we're thinking it contains. This is important! */

	/* InterpreterPlugin>>#getModuleName */
EXPORT(const char*)
getModuleName(void)
{
	return moduleName;
}

	/* FibonacciPlugin>>#primitiveFib */
EXPORT(sqInt)
primitiveFib(void)
{
    sqInt num;
    sqInt result;

	if (!((methodArgumentCount()) == 1)) {
		return primitiveFailFor(-1);
	}
	num = stackIntegerValue(0);
	if (failed()) {
		return primitiveFailFor(-2);
	}
	result = fib(num);
	if (failed()) {
		return primitiveFailFor(-3);
	}
	popthenPush((methodArgumentCount()) + 1, integerObjectOf(result));
	return 0;
}

	/* FibonacciPlugin>>#primitiveFibRec */
EXPORT(sqInt)
primitiveFibRec(void)
{
    sqInt num;
    sqInt result;

	if (!((methodArgumentCount()) == 1)) {
		return primitiveFailFor(-1);
	}
	num = stackIntegerValue(0);
	if (failed()) {
		return primitiveFailFor(-2);
	}
	result = fibRec(num);
	if (failed()) {
		return primitiveFailFor(-3);
	}
	popthenPush((methodArgumentCount()) + 1, integerObjectOf(result));
	return 0;
}


/*	Note: This is coded so that it can be run in Squeak. */

	/* InterpreterPlugin>>#setInterpreter: */
EXPORT(sqInt)
setInterpreter(struct VirtualMachine*anInterpreter)
{
    sqInt ok;

	interpreterProxy = anInterpreter;
	ok = ((interpreterProxy->majorVersion()) == (VM_PROXY_MAJOR))
	 && ((interpreterProxy->minorVersion()) >= (VM_PROXY_MINOR));
	if (ok) {
		
#if !defined(SQUEAK_BUILTIN_PLUGIN)
		failed = interpreterProxy->failed;
		integerObjectOf = interpreterProxy->integerObjectOf;
		methodArgumentCount = interpreterProxy->methodArgumentCount;
		popthenPush = interpreterProxy->popthenPush;
		primitiveFailFor = interpreterProxy->primitiveFailFor;
		stackIntegerValue = interpreterProxy->stackIntegerValue;
#endif /* !defined(SQUEAK_BUILTIN_PLUGIN) */
	}
	return ok;
}


#ifdef SQUEAK_BUILTIN_PLUGIN

static char _m[] = "Fibonacci";
void* Fibonacci_exports[][3] = {
	{(void*)_m, "getModuleName", (void*)getModuleName},
	{(void*)_m, "primitiveFib\000\000", (void*)primitiveFib},
	{(void*)_m, "primitiveFibRec\000\000", (void*)primitiveFibRec},
	{(void*)_m, "setInterpreter", (void*)setInterpreter},
	{NULL, NULL, NULL}
};

#else /* ifdef SQ_BUILTIN_PLUGIN */

signed char primitiveFibAccessorDepth = 0;
signed char primitiveFibRecAccessorDepth = 0;

#endif /* ifdef SQ_BUILTIN_PLUGIN */
