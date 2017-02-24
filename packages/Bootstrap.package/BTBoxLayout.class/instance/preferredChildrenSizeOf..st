as yet unclassified
preferredChildrenSizeOf: aWidget
	| spacing |
	vertical := aWidget vertical.
	
	childSizes := Array new: aWidget submorphCount.
	spacing := aWidget submorphCount - 1 * aWidget spacing.
	expand := {false. false}.
	hasHeightForWidth := false.
	expanderCount := 0.
	totalMin := totalNat := aWidget vertical
		ifTrue: [0 @ spacing]
		ifFalse: [spacing @ 0].

	aWidget submorphs doWithIndex: [ :child :index | | minAndNat |
		minAndNat := child preferredSize.
		childSizes at: index put: minAndNat.
		
		hasHeightForWidth := hasHeightForWidth or: [child hasHeightForWidth].
		(expand first and: [expand second]) ifFalse: [ | childExpand |
			childExpand := child wantsExpandIn: vertical.
			(childExpand at: (vertical ifTrue: [2] ifFalse: [1])) ifTrue: [ expanderCount := expanderCount + 1 ].
			expand := {expand first or: [childExpand first]. expand second or: [childExpand second]} ].
		
		aWidget vertical
			ifTrue: [
				totalMin := (minAndNat first x max: totalMin x) @ (totalMin y + minAndNat first y).
				totalNat := (minAndNat second x max: totalNat x) @ (totalNat y + minAndNat second y)]
			ifFalse: [
				totalMin := (totalMin x + minAndNat first x) @ (minAndNat first y max: totalMin y).
				totalNat := (totalNat x + minAndNat second x) @ (minAndNat second y max: totalNat y)]].
	
	^{totalMin. totalNat}