as yet unclassified
upload
	| window uploadBox scriptTagArea uploadArea tagArea tagTextArea |
	
	tagArea := (BTWidget new
				withLayout;
				vertical: false;
				add: (BTBadge text: 'Latin' type: #info);
				yourself).
				
	tagTextArea := ((BTTextAreaWithLabel
			text: 'Tag scripts and languages'
			placeholder: 'Start Typing for Autocomplete' 
			suggestions: {'Latin'. 'Greek'. 'Japanese'. 'German'. 'English'. 'Esperanto'. 'Spanish'. 'French'})).
	tagTextArea textArea returnDo: [ tagArea add: (BTBadge text: (tagTextArea textArea text) type: #info).
		tagTextArea textArea text: '' ].
	
	scriptTagArea := BTWidget new
		withLayout;
		vertical: true;
		spacing: BTWidget spacing / 4;
		add: (tagTextArea
			add: tagArea).
				
	uploadArea := BTWidget new
		withLayout;
		vertical: false;
		spacing: BTWidget spacing;
		add: (BTWidget new
			withLayout;
			vertical: true;
			spacing: BTWidget spacing;
			expand: true;
			add: (BTLabel bold: 'Upload from File');
			add: ((BTButton icon: #upload) colorType: #primary));
		add: (BTWidget new
			withLayout;
			vertical: true;
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