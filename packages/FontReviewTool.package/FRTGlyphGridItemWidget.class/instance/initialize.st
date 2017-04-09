initialize-release
initialize

	super initialize.

	counter := BTLabel new.

	self
		withLayout;
		vertical: true;
		padding: BTWidget spacing / 2