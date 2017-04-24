lifecycle
updateList

	| orderedTexts |
	sampleTextList
		removeAllMorphs;
		add: BTDivider new.
	
	^ ((FRTSampleText loadAllFrom: self topLevel backend populate: #('author'))
		then: [:texts |
			orderedTexts := texts sorted: [:text1 :text2 | text1 title <= text2 title].
			orderedTexts do: [:text |
				sampleTextList
					add: (BTPage row
						add: ((BTClickableWithText heading: text title)
							when: #clicked send: #openSampleText: to: self with: text)
						oppositeTo: (BTLabel subHeading: text author username));
					"add: (BTLabel text: text text);" "Preview-Text"
					add: BTDivider new]])
		catch: [self add: (BTAlert text: 'Failed to load sample text list.' type: #danger)]