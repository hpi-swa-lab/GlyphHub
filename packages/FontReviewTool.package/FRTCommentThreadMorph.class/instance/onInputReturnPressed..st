as yet unclassified
onInputReturnPressed: anEvent
	self commentThread comments add: (FRTCommentOld new
		text: commentTextInput theText;
		dateTime: DateAndTime now;
		author: 'Test Reviewer';
		yourself)