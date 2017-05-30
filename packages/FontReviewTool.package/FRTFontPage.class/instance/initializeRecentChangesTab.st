initialize-release
initializeRecentChangesTab

	versionWidgets := BTPage column.
	
	^ recentChangesTab := BTScrollArea new
		add: versionWidgets;
		yourself