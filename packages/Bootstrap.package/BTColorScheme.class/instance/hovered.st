variations
hovered

	^ self background
		ifNotNil: [self background: (self background adjustBrightness: -0.15)]
		ifNil: [self foreground: (self foreground adjustBrightness: -0.25)]