examples
exampleNewComment

	| backend |
	backend := FRTHttpBackend new.
	(((backend login: 'Eva' password: 'eveisevil')
		then: [ :x | (FRTThread load: 1 populate: #(glyphs codepoints) from: backend) ])
		then: [ :thread | (FRTApplication firstPage: (FRTCreateThreadCommentPage new thread: thread)) openInWorld ])
		whenRejected:  [ :err | err signal ]