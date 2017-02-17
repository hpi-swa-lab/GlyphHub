as yet unclassified
placeChildrenOf: aWidget in: newBounds additionalSpace: leftOverPrimary hasExpanders: aBoolean spacing: aNumber minSizes: aCollection
	| position |
	position := aWidget vertical ifTrue: [newBounds top] ifFalse: [newBounds left].
	
	" put submorphs at their places "
	aWidget submorphs withIndexDo: [ :m :index | | box minSize |
		m ignoreLayout ifFalse: [
		minSize := aCollection at: index.
		
		aWidget vertical
			ifTrue: [
				box := (newBounds left @ position) extent:
					newBounds width @
					((m expand or: [aBoolean not]) ifTrue: [ minSize y + leftOverPrimary ] ifFalse: [ minSize y ]).
				position := position + box height + aNumber ]
			ifFalse: [
				box := (position @ newBounds top) extent:
					((m expand or: [aBoolean not]) ifTrue: [ minSize x + leftOverPrimary ] ifFalse: [ minSize x ]) @
					newBounds height.
				position := position + box width + aNumber ].
		
		self applyAlignmentFor: m atSize: minSize in: box ]]