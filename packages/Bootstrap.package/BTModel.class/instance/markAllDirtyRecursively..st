fields
markAllDirtyRecursively: aBoolean

	querying := true.
	[dirtyFlags atAllPut: aBoolean.
	
	 self class fieldNames do: [ :field | | value |
		value := self get: field.
		((value isBTModel or: [value isBTModelList]) and: [value querying not]) ifTrue: [value markAllDirtyRecursively: aBoolean]]]
		ensure: [querying := false]