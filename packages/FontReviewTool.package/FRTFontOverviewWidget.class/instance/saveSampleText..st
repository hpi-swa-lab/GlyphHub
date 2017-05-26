as yet unclassified
saveSampleText: aRichText

	| title family |
	family := self topLevel selectedFont family.
	title := family familyName.
	
	aRichText ifEmpty: [
		self topLevel displayNotification: 'Sample cannot be empty' type: #danger.
		^ self].
	
	^ (((family standardSampleText
		title: title;
		text: aRichText jsonString;
		author: self topLevel user;
		shouldBeInOverview: false;
		saveTo: self topLevel backend)
		then: [:sampleText | family
			standardSampleText: sampleText;
			save])
		then: [:savedFamily |
			self topLevel displayNotification: 'Saving successful' type: #success.
			savedFamily standardSampleText])
		catch: [:error | self topLevel displayNotification: 'Saving failed. Please try again.' type: #danger]