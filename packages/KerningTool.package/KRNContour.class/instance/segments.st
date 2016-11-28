as yet unclassified
segments
	| list |
	list := OrderedCollection new.
	self segmentsDo: [ :segment | list add: segment ].
	^list