as yet unclassified
reject
	" awaits rejection of a promise "
	self waitForPromise: subject.
	
	self assert: subject isRejected operator: 'be rejected' expected: nil