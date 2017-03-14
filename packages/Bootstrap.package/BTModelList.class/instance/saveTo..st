as yet unclassified
saveTo: aBackend
	^Promise all: (self collect: [ :entity | entity saveTo: aBackend ])