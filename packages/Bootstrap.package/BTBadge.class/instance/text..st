as yet unclassified
text: aString
	label ifNil: [
		label := BTLabel new
			styleAttributes: self class styleAttributes;
			yourself.
		self add: label ].
	
	label text: aString