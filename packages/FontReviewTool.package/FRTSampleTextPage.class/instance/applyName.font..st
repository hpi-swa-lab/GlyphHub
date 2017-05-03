ui
applyName: aString font: aFontSuggestionItem

	self selectedFont: aFontSuggestionItem data.
	self topLevel selectedFont: self selectedFont.
	self applyFontToSampleTextWidget