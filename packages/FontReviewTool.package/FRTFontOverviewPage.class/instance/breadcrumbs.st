navigation
breadcrumbs

	^ self font
		ifNil: [{}]
		ifNotNil: [
			{{''. #home. []}.
			 {self font fontName. #font. []}}]