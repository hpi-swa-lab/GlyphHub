running
setUp

	self setUpWithoutPagePrepare: [:topLevel |
		topLevel
			addEntity: (font := self mockFont);
			extraGlifs: self glifs]