font-upload
pickFontToUpload

	| fileChooser stream |
	fileChooser := FileChooser new.
	fileChooser initializeAsSystemWindowWithCaptionPane.
	fileChooser setCaption: 'Select a glyphs or ufo file'.
	fileChooser fileSelectionBlock: [:file :x | true].
	self flag: #TODO. "remove .zip as soon as we can zip ourselves"
	fileChooser setSuffixes: {'glyphs'. 'zip'}.
	stream := fileChooser open.
	^ stream