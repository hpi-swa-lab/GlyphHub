as yet unclassified
reloadOpenBaskerville
	"use with caution"
	self unregisterFont: 'Open Baskerville'.
	KRNUfo3 freeFontCache.
	self register: 'Open Baskerville' font: (KRNUfo3 openBaskerville)