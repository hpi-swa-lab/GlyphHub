as yet unclassified
setUp
	super setUp.

	completionWidget := BTTextCompletion new suggestionsList: {
		{'Andorra'. #ad}.
		{'Germany'. #de}.
		{'France'. #fr}.
		{'Albania'. #ab}.
		{'Argentina'. #ag}.
		{'Austria'. #au}.
		{'Australia'. #as}}