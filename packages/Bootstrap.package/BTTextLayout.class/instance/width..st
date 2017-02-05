as yet unclassified
width: aNumber
	" set the maximum width in px for the layout or -1 to unlimit. returns 
    the calculated dimensions the layout will have to take "
	width := aNumber.
	^self primLayout: self layout width: aNumber