instance creation
unit: anObject
	"Return a resolved Promise. #new is the other half of Promise's unit function; #new returns an unresolved Promise."
	^ Promise basicNew initializeWithResolvedValue: anObject.