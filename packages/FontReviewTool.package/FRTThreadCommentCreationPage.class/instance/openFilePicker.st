actions
openFilePicker

	| imageStream imageForm |
	imageStream := self backend pickImageToUpload.
	imageForm := Form fromBinaryStream: imageStream.
	self attachment: imageForm.
	
	previewArea removeAllMorphs.
	previewArea add: (BTImage form: imageForm)