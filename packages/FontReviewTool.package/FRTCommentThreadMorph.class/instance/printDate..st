as yet unclassified
printDate: aDateAndTime
	| dayMonth time |
	time := (aDateAndTime hour asString padded: #left to: 2 with: $0), ':', (aDateAndTime minute asString padded: #left to: 2 with: $0).
	dayMonth := aDateAndTime dayOfMonth asString, '. ', aDateAndTime monthAbbreviation.
	
	^aDateAndTime asDate = Date today
		ifTrue: [ time ]
		ifFalse: [
			aDateAndTime asDate = Date yesterday
				ifTrue: [ 'Yesterday ', time ]
				ifFalse: [
					aDateAndTime year = Date today year ifTrue: [ dayMonth, ' ', time ]
					ifFalse: [ dayMonth, ' ', aDateAndTime year, ' ', time ]]]