as yet unclassified
createButtonPanel
	^Morph new
		addMorph: self createToggleButton;
		addMorph: (SimpleButtonMorph new hResizing: #spaceFill; vResizing: #spaceFill; yourself);
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		yourself