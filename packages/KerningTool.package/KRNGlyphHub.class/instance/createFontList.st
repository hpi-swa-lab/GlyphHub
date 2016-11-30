as yet unclassified
createFontList
	fontList removeAllMorphs.
	
	fontList addMorph: (self createFontListButton
		label: '+ Add Font';
		actionSelector: #addFont;
		target: self;
		yourself).

	self class fonts do: [ :font | 
		fontList addMorph: (self createFontListButton
			removeAllMorphs;
			actionSelector: #selectFont:;
			target: self;
			arguments: {font};
			addMorph: font asMorph;
			yourself) ]