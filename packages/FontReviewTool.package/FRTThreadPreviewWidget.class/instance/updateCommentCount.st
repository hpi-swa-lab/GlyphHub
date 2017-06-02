updating
updateCommentCount

	^ (self hasNewComments) then: [:hasNewComments |
		hasNewComments
			ifTrue: [commentCount text: (BTIcon icon: #comments), ' New comments'; colorType: #success]
			ifFalse: [ | count |
				count := self thread comments size.
				count = 1
					ifFalse: [commentCount text:  (BTIcon icon: #comments_o), ' ', count asString, ' comments']
					ifTrue: [commentCount text:  (BTIcon icon: #comments_o), ' 1 comment']]]