layout
calculateSizeForWidth: aNumber

	^ (self adjustPreferredSize:
		(self layoutPolicy
			ifNotNilDo: [:layout | layout preferredSizeFor: self width: aNumber - self paddingAsPoint x]
			ifNil: [BTSizeRequest fixed: minSize]))
		+ self paddingAsPoint