initialize-release
initialize

	super initialize.

	icon := BTIcon new
		color: Color white;
		yourself.
	
	self
		add: icon;
		padding: 12