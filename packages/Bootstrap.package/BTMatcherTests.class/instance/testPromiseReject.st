as yet unclassified
testPromiseReject
	self should: [(self expect: (Promise unit: 1)) to reject] raise: TestFailure.
	self should: [(self expect: (Promise new rejectWith: 1)) to not reject] raise: TestFailure.
	self shouldnt: [(self expect: (Promise unit: 1)) to not reject] raise: TestFailure.
	self shouldnt: [(self expect: (Promise new rejectWith: 1)) to reject] raise: TestFailure