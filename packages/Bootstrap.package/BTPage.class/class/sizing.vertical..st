as yet unclassified
sizing: aList vertical: aBoolean
	^self new
		listDirection: (aBoolean ifTrue: [#topToBottom] ifFalse: [#leftToRight]);
		hResizing: aList first;
		vResizing: aList second;
		yourself