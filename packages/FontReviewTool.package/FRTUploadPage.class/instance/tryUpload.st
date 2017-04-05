callback
tryUpload

	| familyName |
	familyName := familyNameBox textArea text.
	
	self clearAlerts.
	familyName ifEmpty: [alertArea add: (BTAlert text: 'Please choose a name for your family' type: #danger)].
	self stream ifNil: [alertArea add: (BTAlert text: 'Please choose a file for your family' type: #danger)].
	
	self stream ifNotNil:[
		familyName ifNotEmpty: [
			(((FRTFamily new familyName: familyName)
			saveTo: self topLevel backend)
			then: [:family | self topLevel backend upload: stream toFamily: family id])
			catch: [:x | self topLevel displayNotification: 'Upload failed. Please try again.' type: #danger]]].
	self flag: #TODO "redirect to newly created project if successful"