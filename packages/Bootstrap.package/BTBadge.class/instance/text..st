accessing
text: aString

	label ifNil: [
		label := BTLabel new
			yourself.
		self add: label].
		self class applyStyleAttributes: label.
	
	label text: aString