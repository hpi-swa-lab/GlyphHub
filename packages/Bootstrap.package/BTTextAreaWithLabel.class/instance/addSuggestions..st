as yet unclassified
addSuggestions: aCollection
	self remove: textArea.  
	textArea := BTTextCompletion new.
	self add: textArea.
	textArea suggestionsList: aCollection    