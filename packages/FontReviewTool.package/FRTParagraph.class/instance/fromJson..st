converting
fromJson: aDictionary

	self
		alignment: (aDictionary at: 'alignment') asSymbol;
		fontNameForPango: (aDictionary at: 'fontNameForPango');
		fontId: (aDictionary at: 'fontId');
		pointSize: (aDictionary at: 'pointSize');
		openTypeFeatures: (aDictionary at: 'openTypeFeatures');
		text: (aDictionary at: 'text');
		deletable: (aDictionary at: 'deletable');
		placeholder: (aDictionary at: 'placeholder')