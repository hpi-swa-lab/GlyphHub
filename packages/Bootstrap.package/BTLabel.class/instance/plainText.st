text
plainText
	| in out |
	self text ifEmpty: [^self text].

	self flag: #todo. " unescape html entities "
	
	out := '' writeStream.
	in := self text readStream.

	[in atEnd] whileFalse: [
		out nextPutAll: (in upTo: $<).
		in upTo: $> ].

	^out contents