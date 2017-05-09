converting
jsonWriteOn: aWriteStream

	^ (Dictionary new
		at: 'alignment' put: self alignment asString;
		at: 'font' put: self font;
		at: 'pointSize' put: self pointSize;
		at: 'text' put: self text;
		at: 'openTypeFeatures' put: self openTypeFeatures;
		yourself) jsonWriteOn: aWriteStream