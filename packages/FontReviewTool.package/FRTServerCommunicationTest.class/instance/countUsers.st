helper
countUsers
	| promise |
	promise := self safePromise: (FRTUser loadAllFrom: backend).
	(self expect: promise) to resolve.
	^promise value size