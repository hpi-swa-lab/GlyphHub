initialize-release
tryUpload

	| familyName |
	familyName := familyNameBox textArea text.
	(((FRTFamily new familyName: familyName)
		saveTo: self topLevel backend)
		then: [:family | self topLevel backend upload: stream toFamily: family id])
		whenRejected: #signal