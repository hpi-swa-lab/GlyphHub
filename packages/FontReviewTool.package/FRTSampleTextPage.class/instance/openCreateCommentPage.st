callbacks
openCreateCommentPage

	self sampleTextWidget selectedText ifNotEmptyDo: [:text |
		FRTThreadCommentCreationPage openNewThreadOn: text font: self selectedFont in: self topLevel]