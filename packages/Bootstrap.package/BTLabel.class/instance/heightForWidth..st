as yet unclassified
heightForWidth: aNumber  
	| desired padding minimum |
	padding := self paddingAsPoint.
	
	desired := self sizeForWidth: aNumber - padding x.
	minimum := self sizeForWidth: self minSize x.
	
	^{minimum y. desired y} + padding y