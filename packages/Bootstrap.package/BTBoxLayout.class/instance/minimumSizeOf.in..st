as yet unclassified
minimumSizeOf: aWidget in: newBounds
	| numberOfExpanding requiredSizePrimary requiredSizeSecondary primarySize newPrimarySize minSizes spacing |
	requiredSizeSecondary := 0.
	numberOfExpanding := 0.
	minSizes := OrderedCollection new.
	primarySize := aWidget vertical ifTrue: [newBounds height] ifFalse: [newBounds width].
	spacing := self requiredSpacingIn: aWidget.
	requiredSizePrimary := spacing.
	
	" determine which our children wants to expand and what minimum they will require "
	aWidget submorphsDo: [ :m | | size |
		m ignoreLayout ifFalse: [
			m expand ifTrue: [ numberOfExpanding := numberOfExpanding + 1 ].
			size := minSizes add: (m minSizeForWidth: newBounds width - spacing).
			size := self flipPoint: size for: aWidget.
			requiredSizePrimary := requiredSizePrimary + size y.
			requiredSizeSecondary := requiredSizeSecondary max: size x ]].
	
	" grow if we can't fit all our children, shrink if none of our children want to expand and neither do we "
	newPrimarySize := ((numberOfExpanding > 0 or: [aWidget expand])
		ifTrue: [ (primarySize max: requiredSizePrimary) ]
		ifFalse: [ requiredSizePrimary ]).
	
	^{newBounds origin extent: (self flipPoint: newPrimarySize @ requiredSizeSecondary for: aWidget).
		requiredSizePrimary.
		numberOfExpanding.
		minSizes}