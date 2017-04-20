layout
preferredSizeForWidth: aNumber
	" return a tuple of your minimum and natural size "
	^(self adjustPreferredSize:
		(self layoutPolicy
			ifNotNilDo: [:layout | layout preferredSizeFor: self width: aNumber - self paddingAsPoint x]
			ifNil: [{minSize. minSize}]))
		+ self paddingAsPoint