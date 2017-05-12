accessing
backend: aBackend

	backend := aBackend.
	
	[querying := true.
	 self class fieldNames do: [:field | | value |
		value := self get: field asSymbol.
		
		((value isBTModelList or: [value isBTModel]) and: [value querying not]) ifTrue: [
			value backend: aBackend]]] ensure: [querying := false]