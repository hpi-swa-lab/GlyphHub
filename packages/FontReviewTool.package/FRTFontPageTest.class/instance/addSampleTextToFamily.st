mock-data
addSampleTextToFamily
	"should only be called after creation of a mock family"

	| text |
	
	text := FRTSampleText new
		text: self mockSampleTextJson;
		title: 'boop';
		author: author.
		
	text families add: family.
	
	family standardSampleText: text.
	
	^ family