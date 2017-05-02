callbacks
openCreateCommentPage

	| selectedText |
	selectedText := self sampleTextWidget selectedText.
	selectedText ifEmpty: [^ self].
	
	FRTThreadCommentCreationPage openNewThreadOn: selectedText font: self selectedFont in: self topLevel