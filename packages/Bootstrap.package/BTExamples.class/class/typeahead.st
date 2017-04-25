examples
typeahead

	| input topLevel |
	input := BTTextCompletion new
		suggestionsList: {'Andorra'. 'Germany'. 'France'. 'Albania'. 'Argentina'. 'Austria'. 'Australia'. 'Andorra2'};
		onlyAllowsExactMatches: true.
	topLevel := BTTopLevel new size: 500 asPoint; add: input.
	input when: #confirmed send: #displayNotification:type: to: topLevel withArguments: {'Confirmed'. #info}.
	^ topLevel