as yet unclassified
significantOther: aPenguin
	significantOther := aPenguin.
	(aPenguin notNil and: [aPenguin significantOther ~~ self]) ifTrue: [ aPenguin significantOther: self ].
	
	self fieldDirty: #significantOther