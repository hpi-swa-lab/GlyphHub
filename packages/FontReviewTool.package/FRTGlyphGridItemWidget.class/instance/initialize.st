initialize-release
initialize

	super initialize.

	counter := BTBadge new ignoreLayout: true.

	self
		withLayout;
		vertical: true;
		padding: BTWidget spacing / 2