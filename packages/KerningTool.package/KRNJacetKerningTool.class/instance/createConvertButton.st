ui-creation
createConvertButton
	^(SimpleButtonMorph new hResizing: #spaceFill; vResizing: #spaceFill; label: 'Create OTF'; target: self; actionSelector: 'createOtf'; color: Color gray; yourself)