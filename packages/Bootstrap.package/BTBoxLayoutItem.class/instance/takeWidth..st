layout
takeWidth: aNumber

	| preferred |
	preferred := self widget preferredSizeForWidth: aNumber.
	
	self
		minSize: (vertical ifTrue: [preferred first y] ifFalse: [preferred first x]);
		naturalSize: (vertical ifTrue: [preferred second y] ifFalse: [preferred second x]);
		finalSize: (vertical ifTrue: [preferred first y] ifFalse: [preferred first x])