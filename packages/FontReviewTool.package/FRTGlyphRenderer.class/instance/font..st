accessing
font: aFont

	font ~~ aFont ifTrue: [
		font := aFont.
		self clearCache]