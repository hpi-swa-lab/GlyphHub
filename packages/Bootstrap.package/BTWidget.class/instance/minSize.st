layout
minSize
	| p padding |
	p := self padding.
	padding := p class = Rectangle ifTrue: [(p left+p right) @ (p top+p bottom)] ifFalse: [p*2].

	^(self layoutPolicy
		ifNotNilDo: [ :layout | (layout minimumSizeOf: self in: (bounds origin extent: 0 asPoint)) first extent max: minSize ]
		ifNil: [ minSize ]) + padding