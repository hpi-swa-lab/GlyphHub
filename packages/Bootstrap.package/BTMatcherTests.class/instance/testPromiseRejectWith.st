as yet unclassified
testPromiseRejectWith
	self should: [(self expect: (Promise unit: 1)) to rejectWith: 6] raise: TestFailure.
	self should: [(self expect: (Promise new rejectWith: 1)) to not rejectWith: 1] raise: TestFailure.
	self shouldnt: [(self expect: (Promise new rejectWith: 1)) to not rejectWith: 6] raise: TestFailure.
	self shouldnt: [(self expect: (Promise unit: 1)) to not rejectWith: 6] raise: TestFailure.
	self shouldnt: [(self expect: (Promise new rejectWith: 1)) to rejectWith: 1] raise: TestFailure