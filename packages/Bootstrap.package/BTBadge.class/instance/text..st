accessing
text: aString

	label ifNil: [
		label := BTLabel new
			yourself.
		self add: label].
		self class applyStyleAtributes: label.
	
	label text: aString