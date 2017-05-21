as yet unclassified
icon: anIconSymbol text: aString linkedPage: aBTPageClass pageInput: anObject

	| bookmark |
	bookmark := BTPageBookmark page: aBTPageClass input: anObject.
	
	^ self icon: anIconSymbol text: aString bookmark: bookmark