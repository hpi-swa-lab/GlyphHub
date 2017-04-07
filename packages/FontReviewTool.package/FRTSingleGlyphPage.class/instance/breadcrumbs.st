navigation
breadcrumbs

	^ self glyph
		ifNil: [ {} ]
		ifNotNil: [ self flag: #todo. {} ]