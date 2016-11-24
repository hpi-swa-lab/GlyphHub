as yet unclassified
font: aFont
	font := aFont.
	inspectView font: aFont; text: (font glyphs keys collect: [ :unicode | Unicode charFromUnicode: unicode ])