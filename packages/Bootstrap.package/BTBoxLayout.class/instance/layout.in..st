as yet unclassified
layout: aWidget in: aBox
	| containerSize leftOverSpace extraExpanderSpace offset |
	vertical := aWidget vertical.
	self preferredChildrenSizeOf: aWidget.
	" todo evaluate if this is still necessary "
	containerSize := aBox extent max: totalMin.
	
	" apply special hfw rules :o "
	(hasHeightForWidth and: [vertical]) ifTrue: [
		self submorphs doWithIndex: [ :child :index | | size |
			child hasHeightForWidth ifTrue: [
				size := child heightForWidth: containerSize x.
				(childSizes at: index) at: 1 put: size; at: 2 put: size ]]].
	
	leftOverSpace := self distributeLeftOver: (self flipPoint: containerSize - totalMin for: aWidget) x for: aWidget among: childSizes.
	extraExpanderSpace := (expanderCount < 1 ifTrue: [0] ifFalse: [aWidget vertical ifTrue: [0 @ leftOverSpace / expanderCount] ifFalse: [leftOverSpace / expanderCount @ 0]]) floor.
	"
	containerSize := self
		resizeContainer: aWidget
		withCurrent: containerSize
		min: (aWidget vertical
				ifTrue: [(self hasExpandersInNonLayoutDirection ifTrue: [containerSize x] ifFalse: [totalNat x clampLow: totalMin x high: containerSize x]) @ (expanderCount > 0 ifTrue: [containerSize y] ifFalse: [containerSize y - leftOverSpace])]
				ifFalse: [(expanderCount > 0 ifTrue: [containerSize x] ifFalse: [containerSize x - leftOverSpace]) @ (self hasExpandersInNonLayoutDirection ifTrue: [containerSize y] ifFalse: [totalNat y clampLow: totalMin y high: containerSize y])])
		origin: aBox origin.
	self fillToNaturalSizeInNonLayoutDirection: childSizes for: aWidget to: containerSize.
	"
	aBox extent ~= containerSize ifTrue: [
		aWidget layoutBounds: (aBox origin extent: containerSize) ].
	
	offset := 0 asPoint.
	aWidget submorphs doWithIndex: [ :child :index | | childSize childBounds expandedChildSize |
		childSize := (childSizes at: index) first.
		expandedChildSize := childSize + ((self expandsInLayoutDirection: child) ifTrue: [extraExpanderSpace] ifFalse: [0]).
		expandedChildSize := aWidget vertical ifTrue: [containerSize x @ expandedChildSize y] ifFalse: [expandedChildSize x @ containerSize y].
		childBounds := aBox origin + offset extent: expandedChildSize.
		offset := offset + (aWidget vertical ifTrue: [0 @ (expandedChildSize y + aWidget spacing)] ifFalse: [(expandedChildSize x + aWidget spacing) @ 0]).
		self applyAlignmentFor: child atSize: childSize in: childBounds ]