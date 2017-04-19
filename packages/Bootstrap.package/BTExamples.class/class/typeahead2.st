examples
typeahead2

	| input |
	input := BTTextCompletion new.
	input suggestionsAsynchronusBlock: [:text | BTPromise unit: {'blah'. 'yay'}].
	
	^ BTTopLevel new size: 500 asPoint; add: input