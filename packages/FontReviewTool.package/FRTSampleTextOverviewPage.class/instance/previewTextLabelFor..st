lifecycle
previewTextLabelFor: aSampleText

	| text richText |

	richText := (FRTRichText new
			fromJson: (Json readFrom: aSampleText text readStream)).
	richText firstParagraph
		ifNotNil: [text := richText firstParagraph text]
		ifNil: [text := ''].

	^ (BTLabel
		text: text)
		ellipsize: #end