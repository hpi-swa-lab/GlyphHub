initialize-release
saveComment: anEvent

	| threadPromise |
	threadPromise := self thread isCreated
		ifTrue: [BTPromise unit: self thread]
		ifFalse: [
			self thread
				title: title text;
				saveTo: self topLevel backend].

	((threadPromise
		then: [:thread | | comment |
			comment := FRTComment new
				author: self topLevel user;
				text: commentText text.
			
			self thread comments add: comment.
			
			comment saveTo: self topLevel backend])
		then: [:comment |
			self topLevel openPage: (FRTThreadPage new thread: self thread)])
		catch: [:x | self topLevel displayNotification: 'Saving failed. Please try again.' type: #danger]