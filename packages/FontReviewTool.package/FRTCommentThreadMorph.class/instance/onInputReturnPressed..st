as yet unclassified
onInputReturnPressed: anEvent
	self commentThread comments add: (FRTComment new
		text: commentTextInput theText;
		dateTime: DateAndTime now;
		author: 'Test Reviewer';
		yourself)