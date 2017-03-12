as yet unclassified
testPromiseResolve
	self should: [(self expect: (Promise new rejectWith: 1)) to resolve] raise: TestFailure.
	self should: [(self expect: (Promise unit: 1)) to not resolve] raise: TestFailure.
	self shouldnt: [(self expect: (Promise new resolveWith: 1)) to not reject] raise: TestFailure.
	self shouldnt: [(self expect: (Promise unit: 1)) to resolve] raise: TestFailure