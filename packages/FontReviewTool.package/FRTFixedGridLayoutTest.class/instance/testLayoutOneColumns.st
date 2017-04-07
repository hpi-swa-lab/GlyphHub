as yet unclassified
testLayoutOneColumns
	
	| container topLevel |
	topLevel := BTTopLevel new padding: 0; spacing: 0; size: 90 @ 500.
	
	container := self container.
	3 timesRepeat: [container add: BTWidget new].
	
	topLevel add: container; fullBounds.
	
	(self expect: container submorphs first position - container position) to equal: 0 @ 0.
	(self expect: container submorphs second position - container position) to equal: 0 @ 50.
	(self expect: container submorphs third position - container position) to equal: 0 @ 100