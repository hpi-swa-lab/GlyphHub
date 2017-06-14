as yet unclassified
outlines: anOutlineWidget

	outlines := anOutlineWidget.
	
	outlineArea
		removeAllMorphs;
		minSize: outlines extent * 2;
		add: outlines.
		
	outlines position: outlineArea position + outlines extent * 0.5