instance creation
label: aString icon: anIconSymbol
	^self new
		text: (BTIcon icon: anIconSymbol), ' ', aString;
		yourself