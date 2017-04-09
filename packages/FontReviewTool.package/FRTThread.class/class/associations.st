accessing
associations
	
	^ {
		#threadGlyphAssociations -> {FRTThreadGlyphAssociation. #thread. #many}.
		#codepoints -> {FRTCodepoint. #thread. #many}.
		#comments -> {FRTComment. #thread. #many}.
		#tags -> {FRTTag. #threads. #many}
	} as: Dictionary