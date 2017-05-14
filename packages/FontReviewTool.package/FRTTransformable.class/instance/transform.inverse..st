as yet unclassified
transform: aTransform inverse: anInverseTransform

	toPosition := aTransform.
	toFontUnits := anInverseTransform.
	
	self submorphsDo: [:morph | morph transform: aTransform inverse: anInverseTransform]