as yet unclassified
tags: aCollectionOfStrings
	tags := aCollectionOfStrings.
	
	self removeAllMorphs.
	
	tags do: [ :tag | self add: (BTBadge text: tag) ].
	
	self add: inputBadge