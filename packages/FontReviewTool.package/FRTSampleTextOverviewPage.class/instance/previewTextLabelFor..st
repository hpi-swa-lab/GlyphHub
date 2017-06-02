lifecycle
previewTextLabelFor: aSampleText

	^ BTLabel new
		text: (FRTRichText fromJsonString: aSampleText text) previewText;
		ellipsize: #end