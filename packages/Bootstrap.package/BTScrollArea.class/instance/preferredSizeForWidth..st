as yet unclassified
preferredSizeForWidth: aNumber
	| preferred |
	container hasSubmorphs ifFalse: [{0 asPoint. 0 asPoint}].

	preferred := container firstSubmorph preferredSizeForWidth: aNumber.

	^{
			(policy first == #scroll ifTrue: [0] ifFalse: [preferred first x]) @
			(policy second == #scroll ifTrue: [0] ifFalse: [preferred first y]).

			preferred second }