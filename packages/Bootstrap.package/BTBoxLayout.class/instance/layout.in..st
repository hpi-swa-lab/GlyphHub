as yet unclassified
layout: aWidget in: aBox
	| minSize nonLayoutDirectionMin |
	self setupDataFor: aWidget.
	self placeChildren: childItems of: aWidget space: (vertical ifTrue: [aBox height] ifFalse: [aBox width]).
	
	nonLayoutDirectionMin := nonLayoutDirectionSizes first max: (vertical ifTrue: [aBox width] ifFalse: [aBox height]).
	minSize := ((self flipPoint: totalMin @ nonLayoutDirectionMin) max: aBox extent) max: aWidget minSize.
	
	aBox extent ~= minSize ifTrue: [ aWidget layoutBounds: (aBox origin extent: minSize) ].
	
	childItems do: [ :child | child applyAlignmentWithOffset: aBox origin in: nonLayoutDirectionMin ]