adding
add: aModel
	super add: aModel.
	
	self field ifNotNil: [
		aModel class associations keysAndValuesDo: [ :associationField :association |
			association second == self field ifTrue: [
				association third == #single
					ifTrue: [ aModel perform: (associationField numArgs: 1) with: self owner ]
					ifFalse: [ | list |
						list := (aModel perform: associationField).
						(list includes: self owner) ifFalse: [ list add: self owner ]]]]]