as yet unclassified
stateColorFor: aType
	^self perform: ('stateColor', aType asString capitalized) asSymbol