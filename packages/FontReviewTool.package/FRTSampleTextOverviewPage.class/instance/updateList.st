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
					add: (BTLabel text: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.' );
					add: BTDivider new]])
		catch: [self add: (BTAlert text: 'Failed to load sample text list.' type: #danger)]