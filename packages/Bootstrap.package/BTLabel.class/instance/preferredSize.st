as yet unclassified
preferredSize
	| min nat |
	nat := self sizeForWidth: -1.
	min := self sizeForWidth: 80.
	
	^{min. nat}