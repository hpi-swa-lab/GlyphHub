instance creation
widgets: aCollection

	| result |
	result := self new.
	aCollection do: [:widget | result addWidget: widget].
	^ result