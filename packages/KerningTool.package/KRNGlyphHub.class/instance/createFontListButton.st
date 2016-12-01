as yet unclassified
createFontListButton
	^SimpleButtonMorph new
		layoutInset: 24;
		color: Color lightGray;
		hResizing: #rigid;
		width: 350;
		vResizing: #shrinkWrap;
		removeAllMorphs;
		yourself