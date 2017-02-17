as yet unclassified
sizeOf: aWidget in: aRectangle
	" returns a triple of the size, additional space for each expanding, array of preferredSizes(min, nat) of children "
	| childSizes data numberOfExpanding preferredSize availableSize stillLeftOver expanderSpace finalSize |
	data := self preferredSizeOf: aWidget in: aRectangle.
	preferredSize := aWidget adjustPreferredSize: data first.
	finalSize := preferredSize second.
	numberOfExpanding := data second.
	childSizes := data third.
	
	availableSize := preferredSize second - preferredSize first.
	stillLeftOver := self distributeLeftOver: (self flipPoint: availableSize for: aWidget) x for: aWidget among: childSizes.
	
	" if we have expanding children, calculate how much all of the still unattributed space they get.
	  if we have no expanding children and we aren't instructed to #fill, we shrink the container to fit "
	numberOfExpanding > 0
		ifTrue: [ expanderSpace := stillLeftOver / numberOfExpanding ]
		ifFalse: [
			(aWidget align at: (aWidget vertical ifTrue: [2] ifFalse: [1])) ~~ #fill
				ifTrue: [ finalSize := finalSize - (self flipPoint: stillLeftOver @ 0 for: aWidget) ]].
	
	" shrink secondary direction too, unless we're filling "
	(aWidget align at: (aWidget vertical ifTrue: [1] ifFalse: [2])) ~~ #fill
		ifTrue: [ finalSize := finalSize - (self flipPoint: 0 @ (self flipPoint: availableSize for: aWidget) y for: aWidget) ].
	
	^{finalSize. expanderSpace. childSizes}