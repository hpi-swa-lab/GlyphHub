accessing
tagListForLanguages: aCollection

	| result relevantLanguages |
	result := OrderedCollection newFrom: self tags.
	relevantLanguages := self languages select: [:language | aCollection includes: language first ].
	result addAll: (relevantLanguages collect: [:each | each first, ' ', each second]).

	^ result