loading
loadGlyph: aGlyph

	^ FRTGlyph
		load: aGlyph id
		populate: #(threadGlyphAssociations 'threadGlyphAssociations.thread' 'threadGlyphAssociations.thread.comments' 'threadGlyphAssociations.thread.comments.author' font 'font.family')
		from: self backend