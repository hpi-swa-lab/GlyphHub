navigation
go: aNumber
	| new |
	new := current + aNumber clampLow: 1 high: stack size.
	new ~= current ifTrue: [ self current: new ].
	
	^stack at: current