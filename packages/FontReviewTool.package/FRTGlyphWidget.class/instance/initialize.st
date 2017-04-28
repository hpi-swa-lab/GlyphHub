initialize-release
initialize
	
	super initialize.
	
	self
		pointSize: 16;
		centered: false;
		square: false.
	
	currentLoadingOperation := BTPromise unit: self.
	glyphNames := #()