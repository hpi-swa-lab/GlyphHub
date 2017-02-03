as yet unclassified
colorsForType: aType
	| type |
	type := aType asString capitalized.
	
	^{
			#background -> (self perform: ('color', type) asSymbol).
			#foreground -> (self perform: ('colorForeground', type) asSymbol).
			#border -> (self perform: ('colorBorder', type) asSymbol)
	} as: Dictionary