converting
fromJson: aDictionary

	self
		alignment: (aDictionary at: 'alignment') asSymbol;
		font: (aDictionary at: 'font');
		pointSize: (aDictionary at: 'pointSize');
		openTypeFeatures: (aDictionary at: 'openTypeFeatures');
		text: (aDictionary at: 'text');
		deletable: (aDictionary at: 'deletable');
		placeholder: (aDictionary at: 'placeholder')