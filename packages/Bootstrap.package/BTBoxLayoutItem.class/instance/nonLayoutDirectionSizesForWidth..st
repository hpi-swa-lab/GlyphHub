layout
nonLayoutDirectionSizesForWidth: aNumber

	| preferred |
	preferred := self widget preferredSizeForWidth: (vertical ifTrue: [aNumber] ifFalse: [aNumber max: self finalSize]).
	^ {vertical ifTrue: [preferred first x] ifFalse: [preferred first y]. vertical ifTrue: [preferred second x] ifFalse: [preferred second y]}