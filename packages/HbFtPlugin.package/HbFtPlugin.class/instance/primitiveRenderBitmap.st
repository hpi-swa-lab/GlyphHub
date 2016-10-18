as yet unclassified
primitiveRenderBitmap
	" primRenderBitmap: aForm string: aString fontSize: fontSize dpi: dpi fontName: fontName "
	<var: #buffer type: 'unsigned char *'>
	<var: #strPtr type: 'char *'>
	<var: #fontNamePtr type: 'char *'>
	<export: true>

	| formOop bmBits bmBitsSize bmDepth bmHeight bmWidth result buffer fontNameLen fontNamePtr fontNameValue strLen strPtr strValue dpi fontSize |
	interpreterProxy methodArgumentCount = 5 ifFalse: [ ^interpreterProxy primitiveFail ].

	" fetch fontName argument pointer and length "
	fontNameValue := interpreterProxy stackValue: 0.
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFail ].
	(interpreterProxy isBytes: fontNameValue) ifFalse: [ ^interpreterProxy primitiveFail ].
	fontNamePtr := interpreterProxy firstIndexableField: fontNameValue.
	fontNameLen := interpreterProxy byteSizeOf: fontNameValue.

	" fetch dpi and fontSize "
	dpi := interpreterProxy stackIntegerValue: 1.
	fontSize := interpreterProxy stackIntegerValue: 2.
	
	" fetch string argument pointer and length "
	strValue := interpreterProxy stackValue: 3.
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFail ].
	(interpreterProxy isBytes: strValue) ifFalse: [ ^interpreterProxy primitiveFail ].
	strPtr := interpreterProxy firstIndexableField: strValue.
	strLen := interpreterProxy byteSizeOf: strValue.

	" fetch form argument and verify "
	formOop := interpreterProxy stackObjectValue: 4.
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFail ].
	(interpreterProxy isPointers: formOop) ifFalse: [ ^interpreterProxy primitiveFail ].
	(interpreterProxy slotSizeOf: formOop) < 5 ifTrue: [ ^interpreterProxy primitiveFail ].
	
	" fetch form's bitmap info "
	bmBits := interpreterProxy fetchPointer: 0 ofObject: formOop.
	(interpreterProxy fetchClassOf: bmBits) = interpreterProxy classBitmap ifFalse: [ ^interpreterProxy primitiveFail ].
	bmBitsSize := interpreterProxy slotSizeOf: bmBits.
	bmWidth := interpreterProxy fetchInteger: 1 ofObject: formOop.
	bmHeight := interpreterProxy fetchInteger: 2 ofObject: formOop.
	bmDepth := interpreterProxy fetchInteger: 3 ofObject: formOop.
	buffer := self cCoerce: (interpreterProxy fetchArray: 0 ofObject: formOop) to: 'void*'.
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFail ].

	" verify bitmap proportions "
	(bmWidth >= 0 and: [bmHeight >= 0]) ifFalse: [ ^interpreterProxy primitiveFail ].
	" TODO check bitmap depth for 2^n "
	
	result := self
		sqBitmapTest: bmBitsSize
		Width: bmWidth
		Height: bmHeight
		Depth: bmDepth
		Pointer: buffer
		Str: strPtr
		Len: strLen
		Ptsize: fontSize
		Dpi: dpi
		Font: fontNamePtr
		Len: fontNameLen.
	
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFail ].
	interpreterProxy pop: (interpreterProxy methodArgumentCount)