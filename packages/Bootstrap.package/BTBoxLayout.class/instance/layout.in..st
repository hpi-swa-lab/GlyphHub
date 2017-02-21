as yet unclassified
layout: aWidget in: aBox
	| containerSize minNatAndChildSizes expanderCount childSizes totalMin leftOverSpace extraExpanderSpace offset hasExpandersInNonLayoutDirection |
	vertical := aWidget vertical.
	
	containerSize := aBox extent.
	minNatAndChildSizes := self preferredChildrenSizeOf: aWidget in: containerSize.
	totalMin := minNatAndChildSizes first.
	childSizes := minNatAndChildSizes third.
	containerSize := containerSize max: totalMin.
	expanderCount := aWidget submorphs count: [ :child | self expandsInLayoutDirection: child ].
	hasExpandersInNonLayoutDirection := self hasExpandersInNonLayoutDirection: aWidget.
	leftOverSpace := self distributeLeftOver: (self flipPoint: containerSize - totalMin for: aWidget) x for: aWidget among: childSizes.
	extraExpanderSpace := (expanderCount < 1 ifTrue: [0] ifFalse: [aWidget vertical ifTrue: [0 @ leftOverSpace / expanderCount] ifFalse: [leftOverSpace / expanderCount @ 0]]) floor.
	
	containerSize := self
		resizeContainer: aWidget
		withCurrent: containerSize
		min: (aWidget vertical
				ifTrue: [(hasExpandersInNonLayoutDirection ifTrue: [containerSize x] ifFalse: [totalMin x]) @ (expanderCount > 0 ifTrue: [containerSize y] ifFalse: [containerSize y - leftOverSpace])]
				ifFalse: [(expanderCount > 0 ifTrue: [containerSize x] ifFalse: [containerSize x - leftOverSpace]) @ (hasExpandersInNonLayoutDirection ifTrue: [containerSize y] ifFalse: [totalMin y])])
		origin: aBox origin.
	
	offset := 0 asPoint.
	aWidget submorphs doWithIndex: [ :child :index | | childSize childBounds expandedChildSize |
		childSize := (childSizes at: index) first.
		expandedChildSize := childSize + ((self expandsInLayoutDirection: child) ifTrue: [extraExpanderSpace] ifFalse: [0]).
		expandedChildSize := aWidget vertical ifTrue: [containerSize x @ expandedChildSize y] ifFalse: [expandedChildSize x @ containerSize y].
		childBounds := aBox origin + offset extent: expandedChildSize.
		offset := offset + (aWidget vertical ifTrue: [0 @ (expandedChildSize y + aWidget spacing)] ifFalse: [(expandedChildSize x + aWidget spacing) @ 0]).
		self applyAlignmentFor: child atSize: childSize in: childBounds ]