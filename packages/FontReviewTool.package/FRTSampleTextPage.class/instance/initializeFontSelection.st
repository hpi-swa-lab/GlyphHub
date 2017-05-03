initialize-release
initializeFontSelection

	fontSelectCompletion suggestionsAsynchronusBlock: [:text |
		(FRTFont loadAllFrom: self backend) then: [:fonts | | fontNames orderedFonts |
			fontNames := OrderedCollection new.
			orderedFonts := fonts sorted: [:font1 :font2 | font1 fontName <= font2 fontName].
			orderedFonts collect: [:font |
				text
					ifNotEmpty: [(font fontName includesSubstring: text caseSensitive: false)
						ifTrue: [(font fontName = text)
							ifFalse: [fontNames add: font fontName asString]]]
					ifEmpty: [fontNames add: font fontName asString]].
			fontNames]].