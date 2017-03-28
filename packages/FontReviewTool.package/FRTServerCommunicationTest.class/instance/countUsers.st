as yet unclassified
countUsers
	| promise |
	promise := FRTUser loadAllFrom: backend.
	(self expect: promise) to resolve.
	^promise value size