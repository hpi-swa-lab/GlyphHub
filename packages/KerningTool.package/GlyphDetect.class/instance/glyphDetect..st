as yet unclassified
glyphDetect: aString
	| ints len list |
	ints := self primGlyphDetect: aString.
	len := ints size // 4.
	list := OrderedCollection new.
	0 to: len - 1 do: [ :index | list add: ((ints at: index * 4 + 1) @ (ints at: index * 4 + 2) corner: (ints at: index * 4 + 3) @ (ints at: index * 4 + 4)) ].
	^list