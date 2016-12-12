as yet unclassified
createButtonPanel
	^Morph new
		addMorph: self createToggleWindingButton;
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		yourself