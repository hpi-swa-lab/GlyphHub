accessing
characters
	^self unicodeCodePoints collect: [ :c | Character codePoint: c ]