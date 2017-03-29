operations
saveTo: aBackend
	^BTPromise all: (self collect: [ :entity | entity saveTo: aBackend ])