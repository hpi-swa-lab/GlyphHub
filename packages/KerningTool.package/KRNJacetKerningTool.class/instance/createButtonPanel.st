ui-creation
createButtonPanel
	^Morph new
		addMorph: self createPointSizePanel;
		addMorph: self createToggleButton;
		addMorph: (SimpleButtonMorph new hResizing: #spaceFill; vResizing: #spaceFill; yourself);
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		yourself