as yet unclassified
add: aWidget oppositeTo: anotherWidget
	self
		addMorphBack: aWidget;
		addMorphBack: (BTWidget horizontalSpacer);
		addMorphBack: anotherWidget