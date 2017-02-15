layout
minSize
	^self layoutPolicy
		ifNotNilDo: [ :layout | (layout minimumSizeOf: self in: (bounds origin extent: 0 asPoint)) first extent max: minSize ]
		ifNil: [ minSize ]