initialize-release
color: aColor
	super color: aColor.
	
	self submorphsDo: [ :s | s color: aColor ]