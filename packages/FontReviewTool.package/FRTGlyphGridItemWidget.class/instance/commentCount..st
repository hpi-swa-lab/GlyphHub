initialize-release
commentCount: aNumber

	aNumber < 1
		ifTrue: [self remove: counter]
		ifFalse: [self add: (counter text: aNumber)]