as yet unclassified
segmentsDo: aBlock
	| previous source stream |
	source := self points copy.
	
	" since we want full elements with start and end, we need to wrap around "
	source addFirst: source last.
	
	stream := ReadStream on: source.
	previous := stream next.
	
	[stream atEnd] whileFalse: [ | point type coord |
		point := stream next.
		type := point second.
		coord := point first.
		
		(type = #onCurve and: [previous second = #onCurve]) ifTrue: [
			aBlock value: #line value: {previous first. coord} ].
		
		type = #cubicOffCurve ifTrue: [
			aBlock value: #cubic value: {previous first. coord. stream next first. stream next first} ].
		
		type = #conicOffCurve ifTrue: [ | points |
			points := {previous first. coord } asOrderedCollection.
			[stream atEnd not and: [points add: stream next first. stream last second ~= #onCurve]] whileTrue.
			aBlock value: #conic value: points ].
	
		previous := stream last ]