as yet unclassified
strip: aString
	| in out |
	self flag: #todo. " unescape html entities "
	
	out := '' writeStream.
	in := aString readStream.

	[in atEnd] whileFalse: [
		out nextPutAll: (in upTo: $<).
		in upTo: $> ].

	^out contents