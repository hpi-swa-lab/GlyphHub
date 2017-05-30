callbacks
openCreateCommentPage

	self font then: [:font |
		self selectedText ifNotEmptyDo: [:text |
			FRTThreadCommentCreationPage
				openNewThreadOn: text
				features: self selectedOpenTypeFeatures
				font: font
				in: self topLevel]]