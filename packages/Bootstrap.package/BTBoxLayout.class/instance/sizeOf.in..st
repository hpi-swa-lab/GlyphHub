as yet unclassified
sizeOf: aWidget in: aBox
	| data leftOverPrimary newBounds numberOfExpandingPrimary requiredSizePrimary availableSizePrimary minSizes |
	data := self minimumSizeOf: aWidget in: aBox.
	newBounds := data first.
	requiredSizePrimary := data second.
	numberOfExpandingPrimary := data third.
	minSizes := data fourth.
	
	newBounds := newBounds origin extent: (newBounds extent max: aWidget minSizeRequest).
	
	" check how much left-over space we have. if we have expanding children, only those get to have left-over space "
	availableSizePrimary := aWidget vertical ifTrue: [newBounds height] ifFalse: [newBounds width].
	leftOverPrimary := availableSizePrimary - requiredSizePrimary / (numberOfExpandingPrimary > 0
		ifTrue: [numberOfExpandingPrimary]
		ifFalse: [aWidget submorphCount]).
	
	^{newBounds. leftOverPrimary. numberOfExpandingPrimary. minSizes}