layout
paddingAsRectangle
	| p |
	p := self padding.
	^p class = Rectangle
		ifTrue: [ p ]
		ifFalse: [ Rectangle left: p asPoint x right: p asPoint x top: p asPoint y bottom: p asPoint y ]