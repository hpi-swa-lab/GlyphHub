as yet unclassified
primitiveLayoutRender
	" layout, form, point, color "
	" color must be converted to number via pixelWordForDepth:32 first "
	<var: #buffer type: 'unsigned char *'>
	<var: #strPtr type: 'char *'>
	<var: #fontNamePtr type: 'char *'>
	<var: #layout type: 'PangoLayout *'>
	<var: #x type: 'double'>
	<var: #y type: 'double'>
	<export: true>

	| formOop bmBits bmDepth bmHeight bmWidth buffer layout color pointOop x y xOop yOop |
	interpreterProxy methodArgumentCount = 4 ifFalse: [ ^interpreterProxy primitiveFailFor: 111 ].

	" fetch the color "
	color := interpreterProxy stackPositiveMachineIntegerValue: 0.
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFailFor: 112 ].

	" fetch point x and y "
	pointOop := interpreterProxy stackValue: 1.
	xOop := interpreterProxy fetchPointer: 0 ofObject: pointOop.
	yOop := interpreterProxy fetchPointer: 1 ofObject: pointOop.
	x := (interpreterProxy isIntegerObject: xOop)
		ifTrue: [interpreterProxy integerValueOf: xOop]
		ifFalse: [interpreterProxy floatValueOf: xOop].
	y := (interpreterProxy isIntegerObject: yOop)
		ifTrue: [interpreterProxy integerValueOf: yOop]
		ifFalse: [interpreterProxy floatValueOf: yOop].
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFailFor: 102 ].

	" fetch form argument and verify "
	formOop := interpreterProxy stackObjectValue: 2.
	(interpreterProxy isPointers: formOop) ifFalse: [ ^interpreterProxy primitiveFailFor: 106 ].
	(interpreterProxy slotSizeOf: formOop) < 5 ifTrue: [ ^interpreterProxy primitiveFailFor: 106 ].
	
	" fetch form's bitmap info "
	bmBits := interpreterProxy fetchPointer: 0 ofObject: formOop.
	(interpreterProxy fetchClassOf: bmBits) = interpreterProxy classBitmap ifFalse: [ ^interpreterProxy primitiveFailFor: 6 ].
	bmWidth := interpreterProxy fetchInteger: 1 ofObject: formOop.
	bmHeight := interpreterProxy fetchInteger: 2 ofObject: formOop.
	bmDepth := interpreterProxy fetchInteger: 3 ofObject: formOop.
	buffer := self cCoerce: (interpreterProxy fetchArray: 0 ofObject: formOop) to: 'void*'.
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFailFor: 108 ].

	" verify bitmap proportions "
	(bmWidth >= 0 and: [bmHeight >= 0]) ifFalse: [ ^interpreterProxy primitiveFailFor: 109 ].
	" TODO check bitmap depth for 32 "
	
	layout := self cCoerce: (interpreterProxy stackIntegerValue: 3) to: 'PangoLayout*'.

	self
		sqLayoutRender: layout
		Width: bmWidth
		Height: bmHeight
		Depth: bmDepth
		Pointer: buffer
		X: x
		Y: y
		Color: color.

	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFailFor: 110 ].
	interpreterProxy pop: interpreterProxy methodArgumentCount