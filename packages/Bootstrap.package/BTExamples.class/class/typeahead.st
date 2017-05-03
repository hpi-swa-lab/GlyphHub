examples
typeahead

	| input topLevel |
	input := BTTextCompletion new
		suggestionsList: {'Andorra'. 'Germany'. 'France'. 'Albania'. 'Argentina'. 'Austria'. 'Australia'. 'Andorra2'};
		onlyAllowsExactMatches: true;
		displayAllWhenEmpty: true.
	topLevel := BTTopLevel new size: 500 asPoint; add: input.
	input when: #confirmed evaluate: [:text :item | topLevel displayNotification: text type: #info].
	^ topLevel