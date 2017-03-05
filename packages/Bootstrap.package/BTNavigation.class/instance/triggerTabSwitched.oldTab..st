as yet unclassified
triggerTabSwitched: newTab oldTab: oldTab
	self triggerEvent: #tabSwitched withArguments: {newTab. oldTab}