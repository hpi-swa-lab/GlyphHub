instance creation
newWithRenderer: aRenderer
	
	^ self basicNew
		initializeWithRenderer: aRenderer;
		yourself