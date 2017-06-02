initialize-release
initializeAboutArea

	^ BTScrollArea new
		add: (BTPage column
			minSize: 300 @ 0;
			add: (BTLabel subcategoryHeader: 'About the Font');
			add: (about := BTLabel new);
			add: (BTLabel subcategoryHeader: 'About the Author');
			add: (biography := BTLabel new))