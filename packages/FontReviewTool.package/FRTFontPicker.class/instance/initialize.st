initialize-release
initialize

	super initialize.

	self
		placeholder: 'Enter a Font Name';
		expand: true;
		onlyAllowsExactMatches: true;
		displayAllWhenEmpty: true;
		minSize: 200 @ 0