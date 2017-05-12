initialize-release
sortedGlyphNamesFrom: aRenderer

	^ aRenderer loadedGlifs keys sorted: [:a :b | (a compare: b caseSensitive: false) = 1]