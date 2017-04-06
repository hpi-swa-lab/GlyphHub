removing
markAllDirtyRecursively: aBoolean

	querying := true.
	
	[self do: [:model |
		model querying ifFalse: [model markAllDirtyRecursively: aBoolean]]] ensure: [querying := false]