as yet unclassified
wrap: aMode
	" one of #char, #word_char, #word. default to #word "
	self layout wrap: aMode.
	self layoutChanged; changed