ui
scriptTagArea

	| labeledTextArea |
	tagList := BTTagList new
		padding: 0@0.
	
	labeledTextArea := ((BTTextAreaWithLabel
		text: 'Tag Scripts and Languages'
		placeholder: 'Start Typing for Autocomplete' 
		textAreaClass: BTTextCompletion)).
	
	labeledTextArea textArea suggestionsList: self scriptList.
	labeledTextArea textArea when: #confirmed evaluate: [:text |
		tagList addTag: text.
		labeledTextArea textArea clear].
	
	^ BTPage new
		spacing: BTWidget spacing / 4;
		add: (labeledTextArea
			add: tagList)