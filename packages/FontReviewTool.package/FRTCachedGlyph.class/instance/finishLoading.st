as yet unclassified
finishLoading

	self loadingPromise isPending ifTrue: [
		self loadingPromise resolveWith: self]