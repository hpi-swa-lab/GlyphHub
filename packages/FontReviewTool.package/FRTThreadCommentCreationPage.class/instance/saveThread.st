callbacks
saveThread

	^ self thread isCreated
		ifTrue: [BTPromise unit: self thread]
		ifFalse: [
			self thread
				title: title text;
				saveTo: self topLevel backend]