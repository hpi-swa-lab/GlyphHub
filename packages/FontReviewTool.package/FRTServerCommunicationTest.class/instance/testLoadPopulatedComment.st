testing
testLoadPopulatedComment
	| comment commentPromise |
	commentPromise := self safePromise: (FRTComment load: 1 populate: #(author) from: backend).
	
	(self expect: commentPromise) to resolve.
	
	comment := commentPromise value.
	
	(self expect: comment class) to be: FRTComment.
	(self expect: comment author) to not be: nil.
	(self expect: comment author class) to equal: FRTUser