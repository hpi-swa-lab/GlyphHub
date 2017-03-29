as yet unclassified
testPromiseRejectWith
	self should: [(self expect: (BTPromise unit: 1)) to rejectWith: 6] raise: TestFailure.
	self should: [(self expect: (BTPromise new rejectWith: 1)) to not rejectWith: 1] raise: TestFailure.
	self shouldnt: [(self expect: (BTPromise new rejectWith: 1)) to not rejectWith: 6] raise: TestFailure.
	self shouldnt: [(self expect: (BTPromise unit: 1)) to not rejectWith: 6] raise: TestFailure.
	self shouldnt: [(self expect: (BTPromise new rejectWith: 1)) to rejectWith: 1] raise: TestFailure