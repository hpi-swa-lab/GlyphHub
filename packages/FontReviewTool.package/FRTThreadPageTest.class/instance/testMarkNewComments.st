testing
testMarkNewComments

	| commentWidgets |
	
	commentWidgets := self topLevel findAllWidgetsOfKind: FRTCommentWidget.
	(self expect: commentWidgets first color) to equal: Color transparent.
	(self expect: commentWidgets second color) to equal: Color transparent.
	(self expect: commentWidgets third color) to not equal: Color transparent