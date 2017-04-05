font-upload
pickFontToUpload

	| fc stream |
	fc := FileChooser new.
	fc initializeAsSystemWindowWithCaptionPane.
	fc setCaption: 'Select a glyphs or ufo file'.
	fc fileSelectionBlock: [ :file :x | true ].
	self flag: #TODO. "remove .zip as soon as we can zip ourselves"
	fc setSuffixes: {'glyphs'. 'ufo.zip'}.
	stream := fc open.
	^ stream