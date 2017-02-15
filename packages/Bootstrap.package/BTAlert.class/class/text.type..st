as yet unclassified
text: aString type: aColorType
	^self new
		colorType: aColorType;  
		add: (BTLabel text: aString);
		yourself