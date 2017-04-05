updating
updateList

	self removeAllMorphs.
	
	((FRTFamily loadAllFrom: self topLevel backend populate: #('fonts' 'fonts.author'))
		then: [:families |
			(families do: [:family |
				self
					add: (self createFamilyPreview: family);
					add: BTDivider new])])
		whenRejected: #signal
		"catch: [:err | self add: (BTAlert text: 'Failed to load font list.' type: #danger)]"