as yet unclassified
parent: aPenguin
	parent := aPenguin.

	(aPenguin eggs includes: self) ifFalse: [ aPenguin eggs add: self ].
	self fieldDirty: #penguin