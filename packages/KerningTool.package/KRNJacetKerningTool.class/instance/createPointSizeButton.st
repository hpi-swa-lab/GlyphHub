as yet unclassified
createPointSizeButton
	^(SimpleButtonMorph new hResizing: #spaceFill; vResizing: #spaceFill; label: 'Update Point Size'; target: self; actionSelector: 'updateTargetPtSize'; color: Color lightGray; yourself)