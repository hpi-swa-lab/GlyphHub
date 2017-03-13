as yet unclassified
isValid
	self class instVarNames do: [:varName | | validationMethod |
		validationMethod := ('validate', varName capitalized, ':') asSymbol.
		(self respondsTo: validationMethod) ifTrue: [[(self perform: validationMethod with: (self perform: varName asSymbol))] on: BTModelValidationFailure do: [^false]]] .
	^true
	