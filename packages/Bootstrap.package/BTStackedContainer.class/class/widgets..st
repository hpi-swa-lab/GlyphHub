as yet unclassified
widgets: aCollection
	| result |
	result := self new.
	aCollection do: [:widget | result addWidget: widget].
	^result