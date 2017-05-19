callbacks
saveComment
	"Saves a new comment to an existing thread or a new comment while creating a new thread for it"

	^ ((((self saveThread
		then: [:thread | | comment |
			comment := FRTComment new
				author: self topLevel user;
				text: commentText text.
			
			self thread comments add: comment.
			comment saveTo: self backend])
		then: [:comment | self saveAttachmentTo: comment])
		then: [:comment | self subscribeToThreadOf: comment])
		then: [:comment | self topLevel openPage: FRTThreadPage new with: {self thread. self enteredFromGlyph}])
		catch: [:error | self topLevel displayNotification: 'Saving failed. Please try again.' type: #danger]