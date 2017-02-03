as yet unclassified
primitiveRenderBitmapColored
	" primRenderLayout: layout bitmap: aForm string: aString fontSize: fontSize dpi: dpi fontName: fontName origin: aPoint color: aColor
	color must be converted to number via pixelWordForDepth:32 first "
	<var: #buffer type: 'unsigned char *'>
	<var: #strPtr type: 'char *'>
	<var: #fontNamePtr type: 'char *'>
	<var: #layout type: 'PangoLayout *'>
	<var: #x type: 'double'>
	<var: #y type: 'double'>
	<export: true>

	| formOop bmBits bmBitsSize bmDepth bmHeight bmWidth buffer fontNameLen fontNamePtr fontNameValue strLen strPtr strValue dpi fontSize layout color pointOop x y xOop yOop |
	interpreterProxy methodArgumentCount = 8 ifFalse: [ ^interpreterProxy primitiveFailFor: 111 ].

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

	" fetch fontName argument pointer and length "
	fontNameValue := interpreterProxy stackValue: 2.
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFailFor: 103 ].
	(interpreterProxy isBytes: fontNameValue) ifFalse: [ ^interpreterProxy primitiveFailFor: 104 ].
	fontNamePtr := interpreterProxy firstIndexableField: fontNameValue.
	fontNameLen := interpreterProxy byteSizeOf: fontNameValue.

	" fetch dpi and fontSize "
	dpi := interpreterProxy stackIntegerValue: 3.
	fontSize := interpreterProxy stackIntegerValue: 4.
	
	" fetch string argument pointer and length "
	strValue := interpreterProxy stackValue: 5.
	(interpreterProxy isBytes: strValue) ifFalse: [ ^interpreterProxy primitiveFailFor: 105 ].
	strPtr := interpreterProxy firstIndexableField: strValue.
	strLen := interpreterProxy byteSizeOf: strValue.

	" fetch form argument and verify "
	formOop := interpreterProxy stackObjectValue: 6.
	(interpreterProxy isPointers: formOop) ifFalse: [ ^interpreterProxy primitiveFailFor: 106 ].
	(interpreterProxy slotSizeOf: formOop) < 5 ifTrue: [ ^interpreterProxy primitiveFailFor: 106 ].
	
	" fetch form's bitmap info "
	bmBits := interpreterProxy fetchPointer: 0 ofObject: formOop.
	(interpreterProxy fetchClassOf: bmBits) = interpreterProxy classBitmap ifFalse: [ ^interpreterProxy primitiveFailFor: 6 ].
	bmBitsSize := interpreterProxy slotSizeOf: bmBits.
	bmWidth := interpreterProxy fetchInteger: 1 ofObject: formOop.
	bmHeight := interpreterProxy fetchInteger: 2 ofObject: formOop.
	bmDepth := interpreterProxy fetchInteger: 3 ofObject: formOop.
	buffer := self cCoerce: (interpreterProxy fetchArray: 0 ofObject: formOop) to: 'void*'.
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFailFor: 108 ].

	" verify bitmap proportions "
	(bmWidth >= 0 and: [bmHeight >= 0]) ifFalse: [ ^interpreterProxy primitiveFailFor: 109 ].
	" TODO check bitmap depth for 2^n "
	
	layout := self cCoerce: (interpreterProxy stackIntegerValue: 7) to: 'PangoLayout*'.

	layout := self
		sqBitmapLayout: layout
		Size: bmBitsSize
		Width: bmWidth
		Height: bmHeight
		Depth: bmDepth
		Pointer: buffer
		Str: strPtr
		Len: strLen
		Ptsize: fontSize
		Dpi: dpi
		Font: fontNamePtr
		Len: fontNameLen
		X: x
		Y: y
		Color: color.

	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFailFor: 110 ].
	interpreterProxy
		pop: (interpreterProxy methodArgumentCount + 1)
		thenPush: (interpreterProxy integerObjectOf: (self cCoerce: layout to: 'sqInt'))