event handling
moveSnappedTo: aPoint unidirectional: aBoolean
	| delta new prev |
	prev := self center.
	new := aPoint + ref.
	
	aBoolean ifTrue: [
		" octant numbers for y axis "
		(#(2 3 6 7) includes: (origin octantOf: new))
			ifTrue: [ new := origin x @ new y ]
			ifFalse: [ new := new x @ origin y ]].
	
	unsnappedPosition := new.
	self editor
		ifNotNilDo: [ :editor | | snappingLines |
			snappingLines := editor updateSnappingLines.
			self center: ((snappingLines detect: [ :line | line third = #y ] ifFound: [ :line | line first x ] ifNone: [ new x ]) @
				(snappingLines detect: [ :line | line third = #x ] ifFound: [ :line | line first y ] ifNone: [ new y ])) ]
		ifNil: [ self center: new ].
	
	delta := self center - prev.
	self changed: #pointMoved with: {self. delta}.
	unsnappedPosition := new