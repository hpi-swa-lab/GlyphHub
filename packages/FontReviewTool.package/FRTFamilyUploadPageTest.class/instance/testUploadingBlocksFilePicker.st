as yet unclassified
testUploadingBlocksFilePicker
	
	| uploadButton |
	uploadButton := page findWidgetOfKind: BTButton labelled: 'Select your .glyphs or .ufo.zip to upload.'.
	(self expect: uploadButton) to not beDisabled.
	
	(self expect: page chooseFile) to resolve.
	
	(self expect: uploadButton) to beDisabled.
	
	self topLevel simulateFinishUploadFor: page family error: nil.
	(self expect: page pollStatus) to resolve.
	
	(self expect: uploadButton) to beDisabled