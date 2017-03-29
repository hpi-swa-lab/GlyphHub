font-upload
pickFontToUpload
	| fc stream |
	fc := FileChooser new.
	fc initializeAsSystemWindowWithCaptionPane.
	fc setCaption: 'Select a glyphs or ufo file'.
	fc fileSelectionBlock: [ :file :x | true ].
	"fc setSuffixes: {'glyphs'. 'ufo'}."
	stream := fc open.
	
	^stream ifNotNil: [ self upload: stream toFont: 1 ]