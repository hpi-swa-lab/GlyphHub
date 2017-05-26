lifecycle
updateList

	| orderedTexts |
	sampleTextList
		removeAllMorphs;
		add: BTDivider new.
	
	^ ((FRTSampleText loadAllFrom: self backend populate: #('author'))
		then: [:texts |
			orderedTexts := (texts select: [:text | text shouldBeInOverview ]) sortedBy: #title.
			orderedTexts do: [:text |
				sampleTextList
					add: (BTPage row
						add: ((BTClickableWithText heading: text title)
							when: #clicked send: #openSampleText: to: self with: text)
						oppositeTo: (BTLabel subHeading: text author username));
					add: (self previewTextLabelFor: text);
					add: BTDivider new]])
		catch: [self add: (BTAlert text: 'Failed to load sample text list.' type: #danger)]