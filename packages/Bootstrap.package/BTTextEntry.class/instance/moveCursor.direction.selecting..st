as yet unclassified
moveCursor: isStrong direction: aNumber selecting: aBoolean
	| data |
	((self cursor = self text size and: [aNumber > 0])
	or: [self cursor = 0 and: [aNumber < 0]]) ifFalse: [
		data := self layout moveCursor: isStrong index: self cursor trailing: 0 direction: aNumber.
		self cursor: data first + data second ].
	
	aBoolean ifFalse: [ self selectionBound: self cursor ]