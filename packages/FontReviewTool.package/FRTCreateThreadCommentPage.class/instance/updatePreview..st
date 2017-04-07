updating
updatePreview: aThread
	
	preview text: (((aThread codepoints
		sorted: [:codepoint1 :codepoint2 | codepoint1 index <= codepoint2 index])
		collect: [:codepoint | Character value: codepoint unicodeValue])
		as: String)