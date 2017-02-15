layout
minSizeForWidth: aNumber
	^(self layoutPolicy
		ifNotNilDo: [ :layout |
			(layout
				minimumSizeOf: self
				in: (self layoutBounds origin extent: aNumber - self paddingAsPoint x @ 0)) first extent max: minSize ]
		ifNil: [ minSize ]) + self paddingAsPoint