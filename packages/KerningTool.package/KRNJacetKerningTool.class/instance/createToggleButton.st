as yet unclassified
createToggleButton
	^(SimpleButtonMorph new hResizing: #spaceFill; vResizing: #spaceFill; label: 'toggle'; target: self; actionSelector: 'toggle'; color: Color darkGray; yourself)