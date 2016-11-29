as yet unclassified
segmentsDoLine: aLineBlock cubic: aCubicBlock conic: aConicBlock
	| previous source stream |
	source := self points copy.
	
	" since we want full elements with start and end, we need to wrap around "
	source addFirst: source last.
	
	stream := source readStream.
	previous := stream next.
	
	[stream atEnd] whileFalse: [ | point type coord |
		point := stream next.
		type := point second.
		coord := point first.
		
		(type == #onCurve and: [previous second == #onCurve]) ifTrue: [
			aLineBlock value: {previous first. coord} ].
		
		type == #cubicOffCurve ifTrue: [
			aCubicBlock value: {previous first. coord. stream next first. stream next first} ].
		
		type == #conicOffCurve ifTrue: [ | points |
			points := {previous first. coord } asOrderedCollection.
			[stream atEnd not and: [points add: stream next first. stream last second ~~ #onCurve]] whileTrue.
			aConicBlock value: points ].
	
		previous := stream last ]