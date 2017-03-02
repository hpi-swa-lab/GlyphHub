as yet unclassified
text: aString placeholder: anotherString suggestions: aCollection
	^ self new
		text: aString;
		addSuggestions: aCollection;  
		placeholder: anotherString;  
		yourself