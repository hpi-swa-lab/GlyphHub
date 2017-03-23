hierarchy
add: aWidget
	container removeAllMorphs.
	container addMorph: aWidget.
	
	container offset: (collapsed
		ifTrue: [ 0 @ aWidget extent y ]
		ifFalse: [ 0 @ 0 ]).
	fullBounds := nil