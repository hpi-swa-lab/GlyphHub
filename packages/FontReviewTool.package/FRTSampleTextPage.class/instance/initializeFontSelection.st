initialize-release
initializeFontSelection

	fontSelectCompletion suggestionsAsynchronusBlock: [:text |
		(FRTFont loadAllFrom: self topLevel backend) then: [:fonts | | collection orderedFonts |
			collection := OrderedCollection new.
			orderedFonts := fonts sorted: [:font1 :font2 | font1 fontName <= font2 fontName].
			orderedFonts collect: [:font |
				text
					ifNotEmpty: [(font fontName includesSubstring: text caseSensitive: false)
						ifTrue: [(font fontName = text)
							ifFalse: [collection add: font fontName asString]]]
					ifEmpty: [collection add: font fontName asString]].
			collection]].