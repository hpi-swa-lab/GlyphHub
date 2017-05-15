primitives
primitiveLayoutRender
	" layout, form, point, color, fillColor, clipX, clipY, clipWidth, clipHeight, start, end "
	" color must be converted to number via pixelWordForDepth:32 first "
	<var: #buffer type: 'unsigned char *'>
	<var: #layout type: 'PangoLayout *'>
	<var: #matrix type: 'float *'>
	<var: #color type: 'unsigned int'>
	<var: #clipX type: 'float'>
	<var: #clipY type: 'float'>
	<var: #clipWidth type: 'float'>
	<var: #clipHeight type: 'float'>
	<export: true>

	| formOop bmBits bmDepth bmHeight bmWidth buffer layout color matrix clipHeight clipWidth clipX clipY end start fillColor |
	interpreterProxy methodArgumentCount = 11 ifFalse: [ ^interpreterProxy primitiveFailFor: 111 ].

	" fetch the glyph bounds "
	end := interpreterProxy stackIntegerValue: 0.
	start := interpreterProxy stackIntegerValue: 1.
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFailFor: 118 ].

	" fetch the clip rect "
	clipHeight := interpreterProxy stackFloatValue: 2.
	clipWidth := interpreterProxy stackFloatValue: 3.
	clipY := interpreterProxy stackFloatValue: 4.
	clipX := interpreterProxy stackFloatValue: 5.
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFailFor: 117 ].

	" fetch the color "
	color := interpreterProxy stackPositiveMachineIntegerValue: 7.
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFailFor: 112 ].

	fillColor := interpreterProxy stackPositiveMachineIntegerValue: 6.
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFailFor: 119 ].
	
	" fetch transform matrix "
	matrix := self loadArgumentMatrix: (interpreterProxy stackObjectValue: 8).
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFailFor: 102 ].
	
	" fetch form argument and verify "
	formOop := interpreterProxy stackObjectValue: 9.
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
	
	layout := self sqLayoutForHandle: (interpreterProxy stackIntegerValue: 10).

	self
		sqLayoutRender: layout
		Width: bmWidth
		Height: bmHeight
		Depth: bmDepth
		Pointer: buffer
		Transform: matrix
		Color: color
		FillColor: fillColor
		ClipX: clipX
		ClipY: clipY
		ClipWidth: clipWidth
		ClipHeight: clipHeight
		Start: start
		End: end.

	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFailFor: 110 ].
	interpreterProxy pop: interpreterProxy methodArgumentCount