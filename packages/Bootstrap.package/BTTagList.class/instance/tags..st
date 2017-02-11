as yet unclassified
tags: aCollectionOfStrings
	tags := aCollectionOfStrings.
	
	self removeAllMorphs.
	
	tags do: [ :tag | self add: ((BTBadge text: tag) colorType: colorType) ].
	
	self add: inputBadge