instance creation
items: aCollection
	| result |
	result := self new.
	aCollection do: [:each | result addItem: each].
	^ result