adding
addToAssociations: aModel

	self field ifNotNil: [
		aModel class associations keysAndValuesDo: [ :associationField :association |
			association second == self field ifTrue: [
				association third == #single
					ifTrue: [ aModel set: associationField to: self owner ]
					ifFalse: [ | list |
						list := (aModel get: associationField).
						(list includes: self owner) ifFalse: [ list add: self owner ]]]]]