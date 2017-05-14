as yet unclassified
xmlMoveElement

	| element position |
	position := self elements first startPoint.
	element := XMLElement
		named: 'point'
		attributes: ({#x -> position x asString. #y -> position y asString. #type -> 'move'} as: Dictionary).
	
	^ element