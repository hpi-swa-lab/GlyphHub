as yet unclassified
xmlElementsPointTransform: aBlock

	| elements |
	elements := {controlPoint1Morph. controlPoint2Morph. endPointMorph}
		collect: [:morph | | position |
			position := aBlock value: morph center.
			XMLElement named: 'point' attributes: ({#x -> position x asString. #y -> position y asString} as: Dictionary)].

	elements last attributeAt: #type put: 'curve'.
	self endSmooth ifTrue: [
		elements last attributeAt: #smooth put: 'yes'].

	^ elements