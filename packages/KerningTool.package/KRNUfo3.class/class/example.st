as yet unclassified
example
	" requires https://github.com/klepas/open-baskerville to be in your image's shared folder "
	| font |
	font := KRNUfo3 newForPath: (FileDirectory default / 'open-baskerville' / 'OpenBaskerville.ufo').
	^(font createGlyphForUnicode: 16r00e5 ptSize: 96) openInHand