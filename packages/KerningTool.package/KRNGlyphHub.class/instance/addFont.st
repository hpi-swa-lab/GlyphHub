as yet unclassified
addFont
	(UIManager default request: 'Name of the font?') ifNotEmptyDo: [ :name |
		self class register: name font: (KRNBitmapFont new name: name; yourself).
		self createFontList ]