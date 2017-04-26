callback
tryUpload

	| familyName tags |
	familyName := familyNameBox textArea text.
	tags := OrderedCollection new.
	
	self clearAlerts.
	familyName ifEmpty: [alertArea add: (BTAlert text: 'Please choose a name for your family' type: #danger)].
	self fontFileStream ifNil: [alertArea add: (BTAlert text: 'Please choose a file for your family' type: #danger)].
	
	tagList submorphs do: [:tag | tags add: tag text].
	
	self fontFileStream ifNotNil:[| family |
		familyName ifNotEmpty: [
			family := FRTFamily new familyName: familyName.
			tags do: [:tag | | newTag |
				newTag := FRTTag new text: tag.
				family tags add: newTag].
			
			self topLevel startLoadingOperation.
			(((family
				saveTo: self topLevel backend)
				then: [:savedFamily | self topLevel backend upload: self fontFileStream toFamily: savedFamily id commitMessage: 'First Version'])
				then: [
					self topLevel
						stopLoadingOperation;
						openPage: FRTFontOverviewPage new with: family])
				catch: [
					self topLevel
						stopLoadingOperation;
						displayNotification: 'Upload failed. Please try again.' type: #danger]]]