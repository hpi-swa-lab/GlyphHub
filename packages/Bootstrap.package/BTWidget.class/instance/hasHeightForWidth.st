layout
hasHeightForWidth
	^self submorphs anySatisfy: [ :child | child hasHeightForWidth ]