callback
enteringWithThread: aThread andGlyph: aGlyph

	self enteredFromGlyph: aGlyph.
	^ BTPromise all: {self loadGlyph. self loadThread: aThread}