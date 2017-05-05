as yet unclassified
loadList

	^ self font loadAllGlyphNames then: [:list |
		self suggestionsList: list.
		list]