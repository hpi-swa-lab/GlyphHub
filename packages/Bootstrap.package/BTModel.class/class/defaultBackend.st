accessing
defaultBackend

	^ Backend ifNil: [self error: 'No default backend set']