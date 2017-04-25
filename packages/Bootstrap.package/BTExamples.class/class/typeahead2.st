examples
typeahead2

	| input topLevel |
	input := BTTextCompletion new.
	input suggestionsAsynchronusBlock: [:text | BTPromise unit: {'blah'. 'yay'}].
	
	topLevel := BTTopLevel new size: 500 asPoint; add: input.
	input when: #confirmed send: #displayNotification:type: to: topLevel withArguments: {nil. #danger}.
	^ topLevel