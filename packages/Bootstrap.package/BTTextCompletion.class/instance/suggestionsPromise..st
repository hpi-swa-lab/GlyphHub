accessing
suggestionsPromise: aBlock
	" expects a block that will be called with the entered text and returns a promise
		resolving in a list of tupels of {label. userdata} "
	suggestionsPromise := aBlock