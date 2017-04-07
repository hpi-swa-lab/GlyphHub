callback
tryUpload

	| familyName tags |
	familyName := familyNameBox textArea text.
	tags := OrderedCollection new.
	
	self clearAlerts.
	familyName ifEmpty: [alertArea add: (BTAlert text: 'Please choose a name for your family' type: #danger)].
	self stream ifNil: [alertArea add: (BTAlert text: 'Please choose a file for your family' type: #danger)].
	
	tagList submorphs do: [:tag | tags add: tag text].
	
	self stream ifNotNil:[
		familyName ifNotEmpty: [| family |
			family := FRTFamily new familyName: familyName.
			tags do: [:tag | | newTag |
				newTag := FRTTag new text: tag.
				family tags add: newTag].
			((family
				saveTo: self topLevel backend)
				then: [:savedFamily | self topLevel backend upload: stream toFamily: savedFamily id])
				catch: [:x | self topLevel displayNotification: 'Upload failed. Please try again.' type: #danger]]].
	self flag: #TODO "redirect to newly created project if successful"