font-upload
pickFontToUpload

	| fileChooser stream |
	fileChooser := FileChooser new
		initializeAsSystemWindowWithCaptionPane;
		setCaption: 'Select a glyphs or ufo file';
		fileSelectionBlock: [:file :x | true];
		setSuffixes: {'glyphs'. 'zip'}.
	self flag: #TODO. "remove .zip as soon as we can zip ourselves"
	stream := fileChooser open.
	^ stream