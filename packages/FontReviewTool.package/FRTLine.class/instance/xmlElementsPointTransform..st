as yet unclassified
xmlElementsPointTransform: aBlock

	| element position |
	position := aBlock value: self endPoint.
	element := XMLElement
		named: 'point'
		attributes: ({#x -> position x asString. #y -> position y asString. #type -> 'line'} as: Dictionary).

	self endSmooth ifTrue: [
		element attributeAt: #smooth put: 'yes'].

	^ {element}