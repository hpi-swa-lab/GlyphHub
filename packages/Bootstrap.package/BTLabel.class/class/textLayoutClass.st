accessing
textLayoutClass
	^BTPangoTextLayout available ifTrue: [BTPangoTextLayout] ifFalse: [BTMorphicTextLayout]
	"^BTMorphicTextLayout"