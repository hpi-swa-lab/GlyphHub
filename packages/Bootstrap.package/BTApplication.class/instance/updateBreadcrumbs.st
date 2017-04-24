navigation
updateBreadcrumbs

	breadcrumbs removeAllMorphs.

	self openPage breadcrumbs do: [ :crumb |
		breadcrumbs add: ((BTButton label: crumb first icon: crumb second)
			when: #clicked send: #openNewPage:with: to: self withArguments: crumb third)]