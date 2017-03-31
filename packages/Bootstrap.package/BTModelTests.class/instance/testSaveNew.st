as yet unclassified
testSaveNew
	| modelPromise |
	modelPromise := self safePromise: (BTPenguinModel new
		name: 'Rico';
		saveTo: backend).
	
	(self expect: modelPromise) to resolve.
	
	(self expect: modelPromise value isDirty) to be: false.
	(self expect: modelPromise value id) to not equal: 0