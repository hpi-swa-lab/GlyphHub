as yet unclassified
ellipsize: aMode
	" one of #none, #start, #middle, #end "
	self layout ellipsize: aMode.
	self layoutChanged; changed