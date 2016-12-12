as yet unclassified
createToggleWindingButton
	^(SimpleButtonMorph new hResizing: #spaceFill; vResizing: #spaceFill; label: 'toggle winding'; target: self; actionSelector: 'toggleWinding'; color: Color gray; yourself)