as yet unclassified
minimumSizeOf: aWidget in: newBounds
	| numberOfExpandingPrimary numberOfExpandingSecondary requiredSizePrimary requiredSizeSecondary primary secondary primarySize secondarySize newPrimarySize newSecondarySize minSizes |
	primary := aWidget vertical ifTrue: [2] ifFalse: [1].
	secondary := aWidget vertical ifFalse: [2] ifTrue: [1].
	requiredSizePrimary := 0.
	requiredSizeSecondary := 0.
	numberOfExpandingPrimary := 0.
	numberOfExpandingSecondary := 0.
	minSizes := OrderedCollection new.
	
	" determine which our children wants to expand and what minimum they will require "
	aWidget submorphsDo: [ :m | | size |
		m ignoreLayout ifFalse: [
		size := m minSizeForWidth: newBounds width.
		minSizes add: size.
		(m align at: primary) == #expand ifTrue: [ numberOfExpandingPrimary := numberOfExpandingPrimary + 1 ].
		(m align at: secondary) == #expand ifTrue: [ numberOfExpandingSecondary := numberOfExpandingSecondary + 1 ].
		aWidget vertical
			ifFalse: [
				requiredSizePrimary := requiredSizePrimary + size x.
				requiredSizeSecondary := requiredSizeSecondary max: size y ]
			ifTrue: [
				requiredSizePrimary := requiredSizePrimary + size y.
				requiredSizeSecondary := requiredSizeSecondary max: size x ]]].
	
	aWidget hasSubmorphs ifTrue: [
		requiredSizePrimary := requiredSizePrimary + (aWidget submorphCount - 1 * aWidget spacing) ].
	
	" grow if we can't fit all our children, shrink if none of our children want to expand and neither do we "
	primarySize := aWidget vertical ifTrue: [newBounds height] ifFalse: [newBounds width].
	secondarySize := aWidget vertical ifFalse: [newBounds height] ifTrue: [newBounds width].
	newPrimarySize := ((numberOfExpandingPrimary > 0 or: [(aWidget align at: primary) == #expand])
		ifTrue: [ (primarySize max: requiredSizePrimary) ]
		ifFalse: [ requiredSizePrimary ]).
	newSecondarySize := ((numberOfExpandingSecondary > 0 or: [(aWidget align at: secondary) == #expand])
		ifTrue: [ (secondarySize max: requiredSizeSecondary) ]
		ifFalse: [ requiredSizeSecondary ]).
	
	^{newBounds origin extent: (self flipPoint: newPrimarySize @ newSecondarySize for: aWidget).
		requiredSizePrimary.
		requiredSizeSecondary.
		numberOfExpandingPrimary.
		numberOfExpandingSecondary.
		minSizes}