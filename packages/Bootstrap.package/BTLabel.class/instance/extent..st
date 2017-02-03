as yet unclassified
extent: aPoint
	| height |
	height := self primLayout: layout heightForWidth: aPoint x.
	super extent: aPoint x @ height