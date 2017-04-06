testing
testLoadNestedPopulated
	| threadPromise thread |
	threadPromise := FRTThread load: 1 populate: #(glyphs comments 'comments.author') from: backend.
	
	(self expect: threadPromise) to resolve.
	
	thread := threadPromise value.
	
	(self expect: thread glyphs class) to be: BTModelList.
	(self expect: thread glyphs owner) to be: thread.
	(self expect: thread glyphs field) to be: #glyphs.
	(self expect: thread glyphs size) to equal: 3.
	
	(self expect: thread comments class) to be: BTModelList.
	(self expect: thread comments owner) to be: thread.
	(self expect: thread comments field) to be: #comments.
	(self expect: thread comments size) to equal: 3.
	
	thread comments do: [:comment |
		(self expect: comment thread) to be: thread.
		(self expect: comment author class) to be: FRTUser.
		(self expect: comment author comments) to contain: comment]