as yet unclassified
validateAge: aNumber
	self age ifNotNil: [(self expect: aNumber field: #age) to beGreaterEqualsThan: 0]