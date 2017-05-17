lifecycle
previewTextLabelFor: aSampleText

	^ (BTLabel
		text: ((FRTRichText new
			fromJson: (Json readFrom: aSampleText text readStream))
			firstParagraph text))
		ellipsize: #end