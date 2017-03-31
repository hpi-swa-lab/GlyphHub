initialize-release
initialize
	super initialize.
	self backend: BTHTTPModelBackend new.
	
	sidebar := FRTSidebar new.
	
	self contentContainer add: sidebar at: 1