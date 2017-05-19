initialize-release
openCreateCommentPage

	self flag: #todo. " resolve applied OT features "
	(self font) then: [:font |
		self selectedText ifNotEmptyDo: [:text |
			FRTThreadCommentCreationPage openNewThreadOn: text font: font in: self topLevel]]