as yet unclassified
paragraph
	| p |
	p := NewParagraph new
		compose: self text asText style: TextStyle default copy from: 1 in: self innerBounds;
		positionWhenComposed: self position;
		yourself.

	p := p selectionStart: (p characterBlockForIndex: 3) selectionStop: (p characterBlockForIndex: 8).

	^p