layout
preferredSizeForWidth: aNumber
	" return a tuple of your minimum and natural size "
	^self adjustPreferredSize: (self layoutPolicy
		ifNotNilDo: [ :layout | layout preferredSizeFor: self width: aNumber ]
		ifNil: [ {minSize. minSize} ]) + self paddingAsPoint