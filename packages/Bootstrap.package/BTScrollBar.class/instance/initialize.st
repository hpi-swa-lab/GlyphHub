initialize-release
initialize

	super initialize.
	
	self on: #mouseMove send: #scroll: to: self