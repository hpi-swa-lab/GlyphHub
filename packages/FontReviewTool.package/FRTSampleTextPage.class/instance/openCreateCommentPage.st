callbacks
openCreateCommentPage

	self flag: #todo. " resolve applied OT features "
	self sampleTextWidget selectedText ifNotEmptyDo: [:text |
		FRTThreadCommentCreationPage openNewThreadOn: text font: self selectedFont in: self topLevel]