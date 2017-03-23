accessing
makeActive: newActiveTab
	currentTab ifNotNil: [currentTab active: false].
	newActiveTab active: true.
	self triggerTabSwitched: newActiveTab oldTab: currentTab.
	currentTab := newActiveTab