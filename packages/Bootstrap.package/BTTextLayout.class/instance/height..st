as yet unclassified
height: aNumber
	" set the maximum height in px for the layout or -1 to unlimit "
	height := aNumber.
	^self primLayout: self layout width: aNumber