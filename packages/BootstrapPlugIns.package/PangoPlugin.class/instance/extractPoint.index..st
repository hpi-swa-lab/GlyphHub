primitives
extractPoint: pointOop index: aNumber
	| xOop |
	<returnTypeC: 'float'>
	xOop := interpreterProxy fetchPointer: aNumber ofObject: pointOop.
	^(interpreterProxy isIntegerObject: xOop)
		ifTrue: [interpreterProxy integerValueOf: xOop]
		ifFalse: [
			(interpreterProxy isFloatObject: xOop)
				ifTrue: [ interpreterProxy floatValueOf: xOop ]
				ifFalse: [ interpreterProxy primitiveFail. nil ]]