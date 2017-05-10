accessing
backend: aBackend

	[querying := true.
	 self do: [:entity | entity querying ifFalse: [entity backend: aBackend]]] ensure: [querying := false]