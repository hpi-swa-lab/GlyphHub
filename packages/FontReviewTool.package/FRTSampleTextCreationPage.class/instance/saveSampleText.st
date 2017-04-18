as yet unclassified
saveSampleText

	| text title |
	title := titleField textArea text.
	text := textField textArea text.
	title ifEmpty: [self topLevel displayNotification: 'Please choose a title for your sample text' type: #danger.
		^ nil].
	text ifEmpty: [self topLevel displayNotification: 'Sample text cannot be empty' type: #danger.
		^ nil].
	
	((FRTSampleText new
		title: title;
		text: text;
		author: self topLevel user;
		saveTo: self topLevel backend)
		then: [self topLevel openPage: FRTSampleTextOverviewPage new with: nil])
		catch: [:error | self topLevel displayNotification: 'Saving failed. Please try again.' type: #danger]