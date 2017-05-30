callbacks
saveSampleText: aRichText

	| title family |
	family := self topLevel selectedFont family.
	title := family familyName.
	
	aRichText ifEmpty: [
		self topLevel displayNotification: 'Sample cannot be empty' type: #danger.
		^ self].
	
	^ ((family standardSampleText
		title: title;
		text: aRichText jsonString;
		author: self topLevel user;
		shouldBeInOverview: false;
		saveTo: self topLevel backend)
		then: [:savedSampleText|
			self topLevel displayNotification: 'Saving successful' type: #success.
			savedSampleText])
		catch: [:error | self topLevel displayNotification: 'Saving failed. Please try again.' type: #danger]