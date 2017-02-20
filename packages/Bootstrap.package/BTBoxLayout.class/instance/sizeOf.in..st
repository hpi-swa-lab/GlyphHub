as yet unclassified
sizeOf: aWidget in: aPoint
	" returns a triple of the final size, additional space for each expanding child, array of preferredSizes(min, nat) of children "
	| childSizes data numberOfExpanding preferredSize availableSize stillLeftOver expanderSpace finalSize minChildrenSize |
	data := self preferredSizeOfChildren: aWidget in: aPoint.
	Transcript tab; show: {aWidget class name. data}; cr.
	preferredSize := aWidget adjustPreferredSize: data first.
	minChildrenSize := data first first.
	finalSize := aPoint max: preferredSize first.
	numberOfExpanding := data second.
	childSizes := data third.
	
	availableSize := finalSize - minChildrenSize max: 0 asPoint.
	stillLeftOver := self distributeLeftOver: (self flipPoint: availableSize for: aWidget) x for: aWidget among: childSizes.
	
	Transcript show: {'hi'. finalSize. minChildrenSize. availableSize. stillLeftOver. numberOfExpanding}; cr.
	" if we have expanding children, calculate how much all of the still unattributed space they get.
	  if we have no expanding children and we aren't instructed to #fill, we shrink the container to fit "
	numberOfExpanding > 0
		ifTrue: [ expanderSpace := stillLeftOver / numberOfExpanding ]
		ifFalse: [
			(aWidget align at: (aWidget vertical ifTrue: [2] ifFalse: [1])) ~~ #fill
				ifTrue: [ finalSize := finalSize - (self flipPoint: stillLeftOver @ 0 for: aWidget) max: aWidget minSize ]].
	
	" shrink secondary direction too, unless we're filling "
	(aWidget align at: (aWidget vertical ifTrue: [1] ifFalse: [2])) ~~ #fill
		ifTrue: [ | delta |
			delta := finalSize - preferredSize second max: 0 asPoint.
			finalSize := finalSize - (self flipPoint: 0 @ delta y for: aWidget) max: aWidget minSize ].
	
	Transcript show: {'child sizes:'. childSizes. 'final:'. finalSize}; cr.
	^{finalSize. expanderSpace. childSizes}