as yet unclassified
xmlElements

	| elements |
	elements := {self controlPoint1. self controlPoint2. self endPoint}
		collect: [:position |
			XMLElement named: 'point' attributes: ({#x -> position x asString. #y -> position y asString} as: Dictionary)].

	elements last attributeAt: #type put: 'curve'.
	self endSmooth ifTrue: [
		elements last attributeAt: #smooth put: 'yes'].

	^ elements