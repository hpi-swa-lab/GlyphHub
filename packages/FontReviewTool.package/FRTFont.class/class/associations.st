accessing
associations

	^ {
		#author -> {FRTUser. #fonts. #single}.
		#family -> {FRTFamily. #fonts. #single}.
		#codepoints -> {FRTCodepoint. #font. #many}.
		#glyphs -> {FRTGlyph. #font. #many}.
		#tags -> {FRTTag. #fonts. #many}
	} as: Dictionary