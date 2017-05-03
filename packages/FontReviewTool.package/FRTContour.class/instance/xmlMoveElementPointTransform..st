as yet unclassified
xmlMoveElementPointTransform: aBlock

	| element position |
	position := aBlock value: self elements first startPoint.
	element := XMLElement
		named: 'point'
		attributes: ({#x -> position x asString. #y -> position y asString. #type -> 'move'} as: Dictionary).
	
	^ element