as yet unclassified
add: aWidget oppositeTo: anotherWidget
	self
		addMorphBack: aWidget;
		addMorphBack: (BTWidget new hResizing: #spaceFill; yourself);
		addMorphBack: anotherWidget