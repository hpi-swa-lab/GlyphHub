examples
exampleNewComment

	| application page |
	page := FRTCreateThreadCommentPage new.
	application := FRTApplication firstPage: page.
	(((application login: 'Eva' password: 'eveisevil')
		then: [(FRTThread load: 1 populate: #(glyphs codepoints comments 'comments.author') from: application backend)])
		then: [:thread | page thread: thread])
		then: [application openInWorld]