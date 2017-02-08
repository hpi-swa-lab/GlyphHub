as yet unclassified
primitiveLayoutRender
	" layout, form, point, color, clipX, clipY, clipWidth, clipHeight "
	" color must be converted to number via pixelWordForDepth:32 first "
	<var: #buffer type: 'unsigned char *'>
	<var: #layout type: 'PangoLayout *'>
	<var: #matrix type: 'float *'>
	<var: #clipX type: 'float'>
	<var: #clipY type: 'float'>
	<var: #clipWidth type: 'float'>
	<var: #clipHeight type: 'float'>
	<export: true>

	| formOop bmBits bmDepth bmHeight bmWidth buffer layout color matrix clipHeight clipWidth clipX clipY |
	interpreterProxy methodArgumentCount = 8 ifFalse: [ ^interpreterProxy primitiveFailFor: 111 ].

	" fetch the clip rect "
	clipHeight := interpreterProxy stackFloatValue: 0.
	clipWidth := interpreterProxy stackFloatValue: 1.
	clipY := interpreterProxy stackFloatValue: 2.
	clipX := interpreterProxy stackFloatValue: 3.

	" fetch the color "
	color := interpreterProxy stackPositiveMachineIntegerValue: 4.
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFailFor: 112 ].
	
	" fetch transform matrix "
	matrix := self loadArgumentMatrix: (interpreterProxy stackObjectValue: 5).
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFailFor: 102 ].
	
	" fetch form argument and verify "
	formOop := interpreterProxy stackObjectValue: 6.
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
	
	layout := self cCoerce: (interpreterProxy stackIntegerValue: 7) to: 'PangoLayout*'.

	self
		sqLayoutRender: layout
		Width: bmWidth
		Height: bmHeight
		Depth: bmDepth
		Pointer: buffer
		Transform: matrix
		Color: color
		ClipX: clipX
		ClipY: clipY
		ClipWidth: clipWidth
		ClipHeight: clipHeight.

	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFailFor: 110 ].
	interpreterProxy pop: interpreterProxy methodArgumentCount