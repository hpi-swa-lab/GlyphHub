image-upload
pickImageToUpload

	| fileChooser stream |
	fileChooser := FileChooser new
		initializeAsSystemWindowWithCaptionPane;
		setCaption: 'Select an image file';
		fileSelectionBlock: [:file :x | true];
		setSuffixes: {'jpg'. 'jpeg'. 'png'. 'gif'}.
	stream := fileChooser open.
	^ stream