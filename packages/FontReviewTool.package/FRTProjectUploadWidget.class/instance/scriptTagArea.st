ui
scriptTagArea
	| tagArea labeledTextArea |
	tagArea := BTPage row spacing: 0.
	
	labeledTextArea := ((BTTextAreaWithLabel
		text: 'Tag scripts and languages'
		placeholder: 'Start Typing for Autocomplete' 
		textAreaClass: BTTextCompletion)).
	
	labeledTextArea textArea suggestionsList: self scriptList.
	labeledTextArea textArea when: #confirmed evaluate: [ :text |
		tagArea add: (BTBadge text: text type: #info).
		labeledTextArea textArea clear ].
	
	^ BTPage new
		spacing: BTWidget spacing / 4;
		add: (labeledTextArea
			add: tagArea)