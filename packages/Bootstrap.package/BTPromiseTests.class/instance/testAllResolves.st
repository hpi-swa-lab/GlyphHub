as yet unclassified
testAllResolves
	| a b grouped |
	a := Promise new.
	b := Promise new.

	grouped := (Promise all: {a. b}).

	a resolveWith: 1.
	(self expect: grouped isResolved) to be: false.

	b resolveWith: 2.
	(self expect: grouped isResolved) to be: true.
	(self expect: grouped value) to containExactly: {1. 2}