as yet unclassified
preferredExtent
	| fontScale scale |
	fontScale := self font scaleAtPtSize: self ptSize.
	scale := (transform scale asPoint x * fontScale) @ fontScale.
	^originalForm ifNil: [ 0 @ 0 ] ifNotNil: [ originalForm extent x @ self font height * scale ]