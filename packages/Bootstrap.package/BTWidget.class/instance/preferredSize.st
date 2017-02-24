layout
preferredSize
	" return a tuple of your minimum and natural size "
	^self adjustPreferredSize: (self layoutPolicy
		ifNotNilDo: [ :layout | layout preferredChildrenSizeOf: self ]
		ifNil: [ {minSize. minSize} ]) + self paddingAsPoint