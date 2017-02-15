as yet unclassified
placeChildrenOf: aWidget in: newBounds additionalSpace: leftOverPrimary hasExpanders: aBoolean spacing: aNumber minSizes: aCollection
	| position |
	position := aWidget vertical ifTrue: [newBounds top] ifFalse: [newBounds left].
	
	" put submorphs at their places "
	aWidget submorphs withIndexDo: [ :m :index | | box minSize |
		minSize := aCollection at: index.
		
		aWidget vertical
			ifTrue: [
				box := (newBounds left @ position) extent:
					newBounds width @
					((m align second == #expand or: [aBoolean not]) ifTrue: [ minSize y + leftOverPrimary ] ifFalse: [ minSize y ]).
				position := position + box height + aNumber ]
			ifFalse: [
				box := (position @ newBounds top) extent:
					((m align first == #expand or: [aBoolean not]) ifTrue: [ minSize x + leftOverPrimary ] ifFalse: [ minSize x ]) @
					newBounds height.
				position := position + box width + aNumber ].
		
		Transcript show: aWidget class name; show: ' giving '; show: m; show: ' '; show: box extent; show: ' space'; cr.
		self applyAlignmentFor: m atSize: minSize in: box ]