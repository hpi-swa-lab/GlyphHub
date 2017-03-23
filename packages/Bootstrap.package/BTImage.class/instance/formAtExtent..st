layout
formAtExtent: aPoint
	^(cachedForm notNil and: [cachedForm extent = aPoint])
		ifTrue: [ ^cachedForm ]
		ifFalse: [ cachedForm := fillMode = #center
			ifTrue: [ form scaledIntoFormOfSize: aPoint ]
			ifFalse: [ "todo maintain aspect ratio" form scaledToSize: aPoint ]]