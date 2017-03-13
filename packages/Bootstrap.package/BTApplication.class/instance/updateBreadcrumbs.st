accessing
updateBreadcrumbs
	breadcrumbs removeAllMorphs.
		
	self openPage breadcrumbs do: [ :crumb |
		breadcrumbs add: ((BTButton text: crumb first)
			when: #clicked evaluate: [ :event |
				self openPage: crumb second value])]