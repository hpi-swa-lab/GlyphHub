testing
isValid

	querying := true.
	[self class fieldNames do: [:varName | | validationMethod current |
		validationMethod := ('validate', varName capitalized, ':') asSymbol.
		current := self get: varName asSymbol.
		
		((current isBTModel or: [current isBTModelList]) and: [current querying not and: [current isValid not]]) ifTrue: [^ false].
		
		(self respondsTo: validationMethod) ifTrue: [
			[self set: validationMethod to: current]
				on: BTModelValidationFailure do: [^ false]]]] ensure: [querying := false].
	
	^ true