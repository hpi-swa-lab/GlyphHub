as yet unclassified
author
	self comments ifNil: [^''].
	self comments size = 0 ifTrue: [^''].
	^ self comments first author