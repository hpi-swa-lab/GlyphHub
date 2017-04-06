fields
markAllDirtyRecursively: aBoolean

	querying := true.
	[dirtyFlags atAllPut: aBoolean.
	
	 self class instVarNames do: [ :field | | value |
		value := self instVarNamed: field.
		((value isBTModel or: [value isBTModelList]) and: [value querying not]) ifTrue: [value markAllDirtyRecursively: aBoolean]]]
		ensure: [querying := false]