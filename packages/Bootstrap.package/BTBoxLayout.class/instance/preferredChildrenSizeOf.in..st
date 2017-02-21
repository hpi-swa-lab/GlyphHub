as yet unclassified
preferredChildrenSizeOf: aWidget in: aPointOrCollection
	| spacing totalMin totalNat childSizes |
	
	childSizes := Array new: aWidget submorphCount.
	spacing := aWidget submorphCount - 1 * aWidget spacing.
	totalMin := totalNat := aWidget vertical
		ifTrue: [0 @ spacing]
		ifFalse: [spacing @ 0].

	aWidget submorphs doWithIndex: [ :child :index | | minAndNat |
		minAndNat := child preferredSizeForWidth: (aPointOrCollection isPoint
			ifTrue: [aPointOrCollection x]
			ifFalse: [(aPointOrCollection at: index) first x]).
		childSizes at: index put: minAndNat.
		
		aWidget vertical
			ifTrue: [
				totalMin := (minAndNat first x max: totalMin x) @ (totalMin y + minAndNat first y).
				totalNat := (minAndNat second x max: totalNat x) @ (totalNat y + minAndNat second y)]
			ifFalse: [
				totalMin := (totalMin x + minAndNat first x) @ (minAndNat first y max: totalMin y).
				totalNat := (totalNat x + minAndNat second x) @ (minAndNat second y max: totalNat y)]].
	
	^{totalMin. totalNat. childSizes}