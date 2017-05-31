callbacks
saveSampleText: aRichText

	^ ((self topLevel selectedFont family standardSampleText
		text: aRichText jsonString;
		saveTo: self topLevel backend)
			then: [:savedSampleText|
				self topLevel displayNotification: 'Saving successful' type: #success.
				savedSampleText])
			catch: [self topLevel displayNotification: 'Saving failed. Please try again.' type: #danger]