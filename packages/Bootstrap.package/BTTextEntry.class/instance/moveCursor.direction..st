as yet unclassified
moveCursor: isStrong direction: aNumber
	"self primLayout: layout moveCursor: isStrong index: cursor trailing: 0 direction: aNumber"
	self cursor: (self cursor + aNumber clampLow: 0 high: self text size)