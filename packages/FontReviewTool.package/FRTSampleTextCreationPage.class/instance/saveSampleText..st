callbacks
saveSampleText: aRichText

	| title |
	title := titleField textArea text.
	title ifEmpty: [
		self topLevel displayNotification: 'Please choose a title for your sample text' type: #danger.
		^ self].
	
	aRichText ifEmpty: [
		self topLevel displayNotification: 'Sample cannot be empty' type: #danger.
		^ self].
	
	((FRTSampleText new
		title: title;
		text: aRichText jsonString;
		author: self topLevel user;
		saveTo: self backend)
		then: [:sampleText | self topLevel openPage: FRTSampleTextPage new with: sampleText])
		catch: [:error | self topLevel displayNotification: 'Saving failed. Please try again.' type: #danger]