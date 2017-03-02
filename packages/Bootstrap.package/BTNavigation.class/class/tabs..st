as yet unclassified
tabs: aCollection
	| result |
	result := self new.
	aCollection do: [:text | result addTab: text].
	^result
	