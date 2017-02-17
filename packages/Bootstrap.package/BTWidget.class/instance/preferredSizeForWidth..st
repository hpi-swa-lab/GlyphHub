layout
preferredSizeForWidth: aNumber
	" return a tupel of your minimum and natural size given a width "
	^self adjustPreferredSize: (self layoutPolicy
		ifNotNilDo: [ :layout | (layout preferredSizeOf: self in: aNumber - self paddingAsPoint x @ 0) first ]
		ifNil: [ {minSize. minSize} ]) + self paddingAsPoint