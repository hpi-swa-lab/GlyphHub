as yet unclassified
extent: aPoint
	| desired |
	desired := self primLayout: layout heightForWidth: aPoint x.
	super extent: desired