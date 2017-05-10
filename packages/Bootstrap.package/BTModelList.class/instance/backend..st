accessing
backend: aBackend

	self do: [:entity | entity querying ifFalse: [entity backend: aBackend]]