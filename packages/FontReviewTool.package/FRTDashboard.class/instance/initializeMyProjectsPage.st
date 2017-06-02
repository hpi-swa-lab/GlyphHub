initialize-release
initializeMyProjectsPage

	^ BTPage column
		withPadding;
		expand: true;
		add: (BTLabel subHeading: 'My Projects');
		add: (BTScrollArea new
			add: myProjectsArea)