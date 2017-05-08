loading
loadGlyph: aGlyph

	^ FRTGlyph
		load: aGlyph id
		populate: self glyphFields
		from: self backend