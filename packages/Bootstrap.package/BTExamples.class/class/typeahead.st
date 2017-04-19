examples
typeahead

	| input |
	input := BTTextCompletion new suggestionsList: {{'Andorra'. #ad}. {'Germany'. #de}. {'France'. #fr}. {'Albania'. #ab}. {'Argentina'. #ag}. {'Austria'. #au}. {'Australia'. #as}}.
	
	^ BTTopLevel new size: 500 asPoint; add: input