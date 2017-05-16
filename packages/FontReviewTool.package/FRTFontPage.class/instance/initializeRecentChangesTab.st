initialize-release
initializeRecentChangesTab

	versionWidgets := BTPage column.
	
	^ BTScrollArea new
		add: versionWidgets;
		yourself