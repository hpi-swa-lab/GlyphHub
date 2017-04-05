initialize-release
scriptTagArea

	| tagList labeledTextArea |
	tagList := BTTagList new.
	
	labeledTextArea := ((BTTextAreaWithLabel
		text: 'Tag scripts and languages'
		placeholder: 'Start Typing for Autocomplete' 
		textAreaClass: BTTextCompletion)).
	
	labeledTextArea textArea suggestionsList: self scriptList.
	labeledTextArea textArea when: #confirmed evaluate: [ :text |
		tagList addTag: text.
		labeledTextArea textArea clear ].
	
	^ BTPage new
		spacing: BTWidget spacing / 4;
		add: (labeledTextArea
			add: tagList)