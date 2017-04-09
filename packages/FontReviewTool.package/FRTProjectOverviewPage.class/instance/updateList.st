updating
updateList

	familyList
		removeAllMorphs;
		add: BTDivider new.
	
	^ ((FRTFamily loadAllFrom: self topLevel backend populate: #('fonts' 'fonts.author'))
		then: [:families |
			families do: [:family |
				(self displayFamily: family) ifTrue: [
					familyList
						add: (self createFamilyPreview: family);
						add: BTDivider new]]])
		catch: [self add: (BTAlert text: 'Failed to load font list.' type: #danger)]