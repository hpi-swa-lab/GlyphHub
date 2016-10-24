as yet unclassified
createButtonPanel
	^Morph new
		addMorph: (SimpleButtonMorph new hResizing: #spaceFill; vResizing: #spaceFill; yourself);
		addMorph: (SimpleButtonMorph new hResizing: #spaceFill; vResizing: #spaceFill; yourself);
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		yourself