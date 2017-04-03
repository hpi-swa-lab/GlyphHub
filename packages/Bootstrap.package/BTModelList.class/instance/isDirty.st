testing
isDirty

	querying := true.
	^ [self anySatisfy: [ :entity | entity isDirty ]] ensure: [querying := false]