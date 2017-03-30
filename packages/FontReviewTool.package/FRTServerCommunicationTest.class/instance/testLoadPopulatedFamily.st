testing
testLoadPopulatedFamily
	| family familyPromise |
	familyPromise := self safePromise: (FRTFamily load: 1 populate: #(fonts) from: backend).
	
	(self expect: familyPromise) to resolve.
	
	family := familyPromise value.
	
	(self expect: family class) to be: FRTFamily.
	(self expect: family fonts) to not be: nil.
	(self expect: family fonts size) to equal: 2.
	(self expect: family fonts first class) to be: FRTFont