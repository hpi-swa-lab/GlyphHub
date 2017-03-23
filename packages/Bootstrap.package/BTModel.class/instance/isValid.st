testing
isValid
	querying := true.
	[self class instVarNames do: [:varName | | validationMethod current |
		validationMethod := ('validate', varName capitalized, ':') asSymbol.
		current := self perform: varName asSymbol.
		
		((current isBTModel or: [current isBTModelList]) and: [current querying not and: [current isValid not]]) ifTrue: [ ^false ].
		
		(self respondsTo: validationMethod) ifTrue: [
			[ self perform: validationMethod with: current ]
				on: BTModelValidationFailure do: [ ^false ]]]] ensure: [ querying := false ].
	
	^true