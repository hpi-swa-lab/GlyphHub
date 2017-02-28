as yet unclassified
preferredSizeForWidth: aNumber
	| min nat |
	nat := self sizeForWidth: -1.
	min := self sizeForWidth: aNumber.
	
	^{min. nat max: min} + self paddingAsPoint