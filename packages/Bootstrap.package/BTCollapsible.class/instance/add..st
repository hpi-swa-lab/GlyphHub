as yet unclassified
add: aWidget
	container removeAllMorphs.
	container addMorph: aWidget.
	container offset: 0 @ aWidget extent y.
	fullBounds := nil