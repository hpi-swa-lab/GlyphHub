as yet unclassified
tags: aCollectionOfStrings
	| newTags |
	
	tags := OrderedCollection new.
	newTags := aCollectionOfStrings asOrderedCollection.
	self removeAllMorphs.
	
	newTags do: [ :tag | self addTag: tag ]