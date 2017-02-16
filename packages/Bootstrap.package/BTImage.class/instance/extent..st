as yet unclassified
extent: aPoint
	super extent: aPoint.
	"(self scalingMode == #full and: [self form notNil])
		ifTrue: [ super extent: self form extent ]
		ifFalse: [ super extent: aPoint ]"