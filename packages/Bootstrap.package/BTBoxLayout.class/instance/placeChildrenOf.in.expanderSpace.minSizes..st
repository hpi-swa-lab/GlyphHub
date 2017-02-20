as yet unclassified
placeChildrenOf: aWidget in: aBox expanderSpace: aNumber minSizes: aCollection
	| position |
	position := aWidget vertical ifTrue: [aBox top] ifFalse: [aBox left].
	
	Transcript tab; show: {'Giving my children'. aBox extent. 'vertical:'. aWidget vertical. 'expander:'. aNumber}; cr.
	" put submorphs at their places "
	aWidget submorphs withIndexDo: [ :m :index | | box minSize |
		m ignoreLayout ifFalse: [
			minSize := (aCollection at: index) first.
			
			aWidget vertical
				ifTrue: [
					box := (aBox left @ position) extent:
						aBox width @ (m expand ifTrue: [ minSize y + aNumber ] ifFalse: [ minSize y ]).
					position := position + box height + aWidget spacing ]
				ifFalse: [
					box := (position @ aBox top) extent:
						(m expand ifTrue: [ minSize x + aNumber ] ifFalse: [ minSize x ]) @ aBox height.
					position := position + box width + aWidget spacing ].
			Transcript tab; tab; show: {'Child'. m class name. 'gets'. box extent}; cr.
			self applyAlignmentFor: m atSize: minSize in: box ]]