layout
paddingAsPoint
	| p |
	p := self padding asPoint.
	^p class = Rectangle
		ifTrue: [ (p left + p right) @ (p top + p bottom) ]
		ifFalse: [ p * 2 ]