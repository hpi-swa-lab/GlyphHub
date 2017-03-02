as yet unclassified
makeActive: newActiveTab
	currentTab ifNotNil: [currentTab active: false].
	newActiveTab active: true.
	self tabSwitchedDo cull: newActiveTab cull: currentTab.
	currentTab := newActiveTab