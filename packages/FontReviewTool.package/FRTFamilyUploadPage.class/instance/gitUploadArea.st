ui
gitUploadArea

	^ BTPage column
		spacing: BTWidget spacing / 2;
		expand: true;
		add: (BTTextAreaWithLabel text: 'or link a Github repository' placeholder: 'https://github.com/...'  );
		add: ((BTButton label: 'Connect to Github') colorType: #secondary);
		yourself