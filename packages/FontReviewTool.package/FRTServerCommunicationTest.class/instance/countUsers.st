helper
countUsers
	| promise |
	promise := self safePromise: (FRTUser loadAllFrom: backend populate: #()).
	(self expect: promise) to resolve.
	^promise value size