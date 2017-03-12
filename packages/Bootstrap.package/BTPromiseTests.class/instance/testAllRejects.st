as yet unclassified
testAllRejects
	| a b grouped |
	a := Promise new.
	b := Promise new.

	grouped := (Promise all: {a. b}).

	a rejectWith: 5.

	(self expect: grouped isRejected) to be: true.
	(self expect: grouped error) to be: 5