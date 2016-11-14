as yet unclassified
glyphDetect: aString
	| ints len list |
	ints := self primGlyphDetect: aString.
	len := ints size // 4.
	list := OrderedCollection new.
	1 to: len do: [ :index | list add: ((ints at: index + 1) @ (ints at: index + 2) corner: (ints at: index + 3) @ (ints at: index + 4)) ].
	^list