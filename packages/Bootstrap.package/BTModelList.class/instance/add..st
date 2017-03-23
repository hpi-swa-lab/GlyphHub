adding
add: aModel
	super add: aModel.
	
	self field ifNotNil: [
		aModel class associations keysAndValuesDo: [ :associationField :association |
			association second == self field ifTrue: [ aModel perform: (associationField numArgs: 1) with: self owner ]]]