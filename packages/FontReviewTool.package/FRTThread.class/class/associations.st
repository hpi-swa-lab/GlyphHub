accessing
associations
	
	^ {
		#glyphs -> {FRTGlyph. #threads. #many}.
		#codepoints -> {FRTCodepoint. #thread. #many}.
		#comments -> {FRTComment. #thread. #many}
	} as: Dictionary