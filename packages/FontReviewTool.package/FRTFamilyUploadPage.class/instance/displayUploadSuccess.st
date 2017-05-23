callback
displayUploadSuccess
	
	alertArea add: (BTAlert new
		vertical: false;
		spacing: BTWidget spacing;
		add: (BTLabel text: 'Font upload and converted successfully!');
		add: ((BTButton label: 'View your Font!')
			small;
			when: #clicked send: #openFamily to: self);
		colorType: #success)