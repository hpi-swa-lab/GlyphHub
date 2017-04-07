navigation
updateBreadcrumbs

	breadcrumbs removeAllMorphs.
		
	self openPage breadcrumbs do: [ :crumb |
		breadcrumbs add: ((BTButton label: crumb first icon: crumb second)
			when: #clicked evaluate: [ :event |
				self openPage: crumb third value])]