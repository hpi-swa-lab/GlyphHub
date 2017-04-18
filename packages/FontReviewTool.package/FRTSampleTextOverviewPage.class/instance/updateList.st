as yet unclassified
updateList

	sampleTextList
		removeAllMorphs;
		add: BTDivider new.
	
	^ ((FRTSampleText loadAllFrom: self topLevel backend populate: #('author'))
		then: [:texts |
			texts do: [:text |
				sampleTextList
					add: (BTPage row add: (BTLabel heading: text title) oppositeTo: (BTLabel subHeading: text author username));
					"add: (BTLabel text: text text);"
					add: BTDivider new]])
		catch: [self add: (BTAlert text: 'Failed to load sample text list.' type: #danger)]