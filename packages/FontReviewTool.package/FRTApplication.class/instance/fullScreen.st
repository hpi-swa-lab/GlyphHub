actions
fullScreen

	TheWorldMainDockingBar showWorldMainDockingBar: false.

	self
		when: #closed send: #showWorldMainDockingBar: to: TheWorldMainDockingBar with: true;
		position: 0 @ 0;
		extent: World extent