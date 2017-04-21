examples
upload

	| window uploadBox scriptTagArea uploadArea tagArea tagTextArea |	
	tagArea := BTPage row spacing: 0.
	
	tagTextArea := ((BTTextAreaWithLabel
		text: 'Tag scripts and languages'
		placeholder: 'Start Typing for Autocomplete' 
		textAreaClass: BTTextCompletion)).
		
	tagTextArea textArea suggestionsList: {'Latin'. 'Greek'. 'Japanese'. 'German'. 'English'. 'Esperanto'. 'Spanish'. 'French'. 'Klingon'}.
	tagTextArea textArea when: #confirmed evaluate: [ :text |
		tagArea add: (BTBadge text: text type: #info).
		tagTextArea textArea clear ].
	
	scriptTagArea := BTPage new
		spacing: BTWidget spacing / 4;
		add: (tagTextArea
			add: tagArea).
				
	uploadArea := BTPage row
		add: (BTPage column
			expand: true;
			add: (BTLabel bold: 'Upload from File');
			add: (((BTButton icon: #upload) colorType: #primary) align: #(center center)));
		add: (BTPage column
			spacing: BTWidget spacing / 2;
			expand: true;
			add: (BTTextAreaWithLabel text: 'or link a Github repository' placeholder: 'https://github.com/...'  );
			add: ((BTButton label: 'Connect to Github') colorType: #secondary));
		yourself.
	
	uploadBox := (BTPage new vertical: true; expand: true; align: #(fill fill))
		add: (BTLabel heading: 'Upload new Project');
		add: (BTTextAreaWithLabel text: 'Name');
		add: uploadArea;
		add: scriptTagArea;
		add: (((BTButton text: 'Create Project' ) colorType: #primary) align: #(end start)).
	
	window := BTTopLevel new
		size: 600 asPoint;
		add: uploadBox;
		yourself.
		
	^ window