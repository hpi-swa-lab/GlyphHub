font-upload
pickImageToUpload

	| fileChooser stream |
	fileChooser := FileChooser new.
	fileChooser initializeAsSystemWindowWithCaptionPane.
	fileChooser setCaption: 'Select an image file'.
	fileChooser fileSelectionBlock: [:file :x | true].
	fileChooser setSuffixes: {'jpg'. 'jpeg'. 'png'. 'gif'}.
	stream := fileChooser open.
	^ stream