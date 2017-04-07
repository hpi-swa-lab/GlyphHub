as yet unclassified
updatePreview
	
	self text: (((self thread codepoints
		sorted: [:codepoint1 :codepoint2 | codepoint1 index <= codepoint2 index])
		collect: [:codepoint | Character value: codepoint unicodeValue])
		as: String)