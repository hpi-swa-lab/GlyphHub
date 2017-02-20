as yet unclassified
preferredSizeOf: aWidget in: aPoint
	| numberOfExpanding sizes minSize natSize data |
	data := self preferredSizeOfChildren: aWidget in: aPoint.
	minSize := data first first.
	natSize := data first second.
	numberOfExpanding := data second.
	sizes := data third.
	
	natSize := (data first second max: minSize) max:
		(self flipPoint: (((aWidget align first == #fill or: [numberOfExpanding > 0 and: [aWidget vertical not]]) ifTrue: [aPoint x] ifFalse: [0]) @ ((aWidget align second == #fill or: [numberOfExpanding > 0 and: [aWidget vertical]]) ifTrue: [aPoint y] ifFalse: [0])) for: aWidget).
	
	^{aWidget adjustPreferredSize: {minSize. natSize}. numberOfExpanding. sizes}