as yet unclassified
pointSize: aNumber

	aNumber = pointSize ifTrue: [^ self].
	
	pointSize := aNumber.

	self update