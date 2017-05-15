primitives
createPointX: x y: y
	| ptOop xOop yOop |
	ptOop := interpreterProxy instantiateClass: interpreterProxy classPoint indexableSize: 0.
	interpreterProxy pushRemappableOop: ptOop.
	xOop := interpreterProxy positive32BitIntegerFor: x.
	interpreterProxy pushRemappableOop: xOop.
	yOop := interpreterProxy positive32BitIntegerFor: y.
	xOop := interpreterProxy popRemappableOop.
	ptOop := interpreterProxy popRemappableOop.
	interpreterProxy storePointer: 0 ofObject: ptOop withValue: xOop.
	interpreterProxy storePointer: 1 ofObject: ptOop withValue: yOop.
	^ptOop