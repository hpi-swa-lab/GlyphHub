ui-creation
createStandardPointSizeButton
	^(SimpleButtonMorph new hResizing: #spaceFill; vResizing: #spaceFill; label: 'Standard Point Size'; target: self; actionSelector: 'setStandardTargetPtSize'; color: Color veryLightGray; yourself)