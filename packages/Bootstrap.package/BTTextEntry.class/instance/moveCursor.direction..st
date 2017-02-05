as yet unclassified
moveCursor: isStrong direction: aNumber
	| data |
	data := self layout moveCursor: isStrong index: cursor trailing: 0 direction: aNumber.
	self cursor: data first
	"self cursor: (self cursor + aNumber clampLow: 0 high: self text size)"