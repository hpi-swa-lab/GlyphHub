as yet unclassified
uploadArea
	^BTPage row
		add: (BTPage column
			expand: true;
			add: (BTLabel bold: 'Upload from File');
			add: (((BTButton icon: #upload) colorType: #primary) align: #(center center)));
		add: (BTPage column
			spacing: BTWidget spacing / 2;
			expand: true;
			add: (BTTextAreaWithLabel text: 'or link a Github repository' placeholder: 'https://github.com/...'  );
			add: ((BTButton label: 'Connect to Github') colorType: #secondary));
		yourself