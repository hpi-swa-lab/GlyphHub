event handling
moveSnappedTo: aPoint
	| delta new prev |
	prev := self center.
	new := aPoint + ref.
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