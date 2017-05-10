updating
setPreviewGlyphs

	(glyph1 text isEmpty or: [glyph2 text isEmpty]) ifTrue: [^ self].

	^ ((self font family
		previewGlyphs: glyph1 text, ',', glyph2 text;
		save)
		then: [self accept: self font family previewGlyphs])
		catch: [:err | page add: (BTAlert text: 'Updating preview glyphs failed.' type: #danger)]