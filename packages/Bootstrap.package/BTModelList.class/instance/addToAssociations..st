adding
addToAssociations: aModel

	self field ifNotNil: [
		aModel class associations keysAndValuesDo: [:associationField :association |
			(association foreignClass == self owner class and: [association backPopulateKey == self field]) ifTrue: [
				association cardinality == #single
					ifTrue: [aModel set: associationField to: self owner]
					ifFalse: [ | list |
						list := aModel get: associationField.
						(list includes: self owner) ifFalse: [list add: self owner]]]]]