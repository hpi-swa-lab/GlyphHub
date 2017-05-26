initialize-release
initialize
	
	super initialize.
	self canChangeFont: false.
	self
		align: #(fill start);
		saveButtonVisible: false