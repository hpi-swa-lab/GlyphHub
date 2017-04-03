operations
saveTo: aBackend
	| promise |
	
	querying := true.
	[promise := BTPromise all: (self collect: [ :entity | entity saveTo: aBackend ])] ensure: [ querying := false].
	
	^ promise