as yet unclassified
distributeLeftOver: aNumber for: aWidget among: aCollection
	"| spreading extraSpace |
	spreading := (1 to: aCollection size) asOrderedCollection.
	extraSpace := aNumber.
	
	spreading sort: [ :index1 :index2 | | sizes1 sizes2 delta1 delta2 delta |
		sizes1 := aCollection at: index1.
		sizes2 := aCollection at: index2.
		delta1 := sizes1 second - sizes1 first.
		delta2 := sizes2 second - sizes2 first.
		delta := delta2 - delta1.
		delta == 0 ifTrue: [ delta := index2 - index1].
		delta < 0 ].
	
	aCollection size to: 1 do: [ :index | | sizes extra gap glue |
		sizes := aCollection at: (spreading at: index).
		glue := extraSpace + index - 1 / index.
		gap := (self flipPoint: sizes second - sizes first for: aWidget) x.
		extra := (self flipPoint: (glue min: gap) @ 0 for: aWidget) x.
		sizes at: 1 put: (sizes at: 1) + (self flipPoint: extra @ 0 for: aWidget).
		extraSpace := extraSpace - extra ].
	
	^extraSpace"
	^aNumber