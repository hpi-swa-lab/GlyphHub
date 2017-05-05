initialize-release
loadList

	^ self font loadAllGlyphNames then: [:list |
		self suggestionsList: list.
		list]