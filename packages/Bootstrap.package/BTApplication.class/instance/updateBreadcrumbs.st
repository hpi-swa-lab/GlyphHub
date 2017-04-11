navigation
updateBreadcrumbs

	breadcrumbs removeAllMorphs.

	self openPage breadcrumbs do: [ :crumb |
		breadcrumbs add: ((BTButton label: crumb first icon: crumb second)
			when: #clickedNoEvent send: #openNewPage:with: to: self withArguments: crumb third)]