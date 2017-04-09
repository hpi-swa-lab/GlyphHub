helper
emoticonForm

	^ EmoticonForm ifNil: [
		EmoticonForm := Form fromFileNamed: self formPath fullName]