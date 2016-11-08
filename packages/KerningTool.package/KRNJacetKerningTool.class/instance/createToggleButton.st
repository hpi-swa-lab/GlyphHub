ui-creation
createToggleButton
	^(SimpleButtonMorph new hResizing: #spaceFill; vResizing: #spaceFill; label: 'toggle'; target: self; actionSelector: 'toggle'; color: Color lightGray; yourself)