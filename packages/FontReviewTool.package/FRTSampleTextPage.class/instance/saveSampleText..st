callbacks
saveSampleText: aRichText

	aRichText ifEmpty: [
		self topLevel displayNotification: 'Sample cannot be empty.' type: #danger.
		^ self].
	
	((self sampleText
		text: aRichText jsonString;
		saveTo: self backend)
			then: [:sampleText |
				self topLevel
					displayNotification: 'Saving successful.' type: #success;
					openPage: FRTSampleTextPage new with: sampleText])
			catch: [:error | self topLevel displayNotification: 'Saving failed. Please try again.' type: #danger]