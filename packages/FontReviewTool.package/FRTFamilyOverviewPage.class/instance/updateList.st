updating
updateList

	| orderedFamily |
	familyList
		removeAllMorphs;
		add: BTDivider new.
	
	^ ((FRTFamily loadAllFrom: self topLevel backend populate: #('fonts' 'fonts.author'))
		then: [:families |
			orderedFamily := families sorted: [:family1 :family2 | family1 familyName <= family2 familyName].
			orderedFamily do: [:family |
				(self displayFamily: family) ifTrue: [
					familyList
						add: (self createFamilyPreview: family);
						add: BTDivider new]]])
		catch: [self add: (BTAlert text: 'Failed to load font list.' type: #danger)]