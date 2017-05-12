as yet unclassified
for: aUser form: aForm

	^ self new
		lastUpdatedAt: aUser updatedAt;
		form: aForm copy;
		yourself