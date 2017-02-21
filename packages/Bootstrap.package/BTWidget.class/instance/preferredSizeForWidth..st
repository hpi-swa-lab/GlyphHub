layout
preferredSizeForWidth: aNumber
	" return a tuple of your minimum and natural size given a width "
	^self adjustPreferredSize: (self layoutPolicy
		ifNotNilDo: [ :layout | (layout preferredChildrenSizeOf: self in: aNumber - self paddingAsPoint x @ 0) ]
		ifNil: [ {minSize. minSize} ]) + self paddingAsPoint