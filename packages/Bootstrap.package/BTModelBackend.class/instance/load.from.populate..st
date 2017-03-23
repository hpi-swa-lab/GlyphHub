operations
load: aNumber from: aString populate: aCollection
	^self loadBy: #id value: aNumber from: aString class: self populate: aCollection