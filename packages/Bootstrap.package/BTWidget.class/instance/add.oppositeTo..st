as yet unclassified
add: aWidget oppositeTo: anotherWidget
	self
		addMorphBack: aWidget;
		addMorphBack: (BTWidget new hResizing: #spaceFill; height: 1; yourself);
		addMorphBack: anotherWidget