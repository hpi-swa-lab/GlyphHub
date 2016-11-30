as yet unclassified
openScanEditor
	(UIManager default chooseFileMatching: {'png'} label: 'Choose a scan') ifNotNilDo: [ :file |
		KRNBitmapGlyphFontEditorMorph new
			font: selectedFont;
			path: file fullName;
			open ]