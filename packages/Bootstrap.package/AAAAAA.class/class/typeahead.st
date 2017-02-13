as yet unclassified
typeahead
	| input |
	input := BTTextCompletion new suggestionsList: {{'Andorra'. #ad}. {'Germany'. #de}. {'France'. #fr}. {'Albania'. #ab}. {'Argentina'. #ag}. {'Austria'. #au}. {'Australia'. #as}}.
	
	^BTPage topLevel size: 500 asPoint; add: input