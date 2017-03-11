as yet unclassified
textLayoutClass
	^BTPangoTextLayout available ifTrue: [BTPangoTextLayout] ifFalse: [BTMorphicTextLayout]