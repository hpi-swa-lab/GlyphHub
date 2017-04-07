updating
updateList

	familyList
		removeAllMorphs;
		add: BTDivider new.
	
	^ ((FRTFamily loadAllFrom: self topLevel backend populate: #('fonts' 'fonts.author'))
		then: [:families |
			families do: [:family |
				familyList
					add: (self createFamilyPreview: family);
					add: BTDivider new]])
		catch: [:err | self add: (BTAlert text: 'Failed to load font list.' type: #danger)]