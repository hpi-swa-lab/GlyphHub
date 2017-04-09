accessing
enteringWith: aThreadAndGlyph

	| loadGlyph loadThread populateThread |
	self enteredFromGlyph: aThreadAndGlyph second.
	
	loadGlyph := self enteredFromGlyph
		ifNotNil: [
			(FRTGlyph load: aThreadAndGlyph second id populate: #( 'font' 'font.family') from: self topLevel backend)
				then: [:newGlyph | self enteredFromGlyph: newGlyph]]
		ifNil: [BTPromise unit: nil].
	
	populateThread := #(comments  'comments.author' threadGlyphAssociations 'threadGlyphAssociations.glyph' 'threadGlyphAssociations.glyph.font' 'threadGlyphAssociations.glyph.font.family').
	
	loadThread := (FRTThread load: aThreadAndGlyph first id populate: populateThread from: self topLevel backend)
		then: [:newThread |
			self thread: newThread.
			title heading: 'Thread: ', newThread title.
			preview
				pointSize: 64;
				font: newThread threadGlyphAssociations anyOne glyph font;
				glyphNames: (newThread threadGlyphAssociations collect: [:association | association glyph glyphName]).

			self
				loadComments;
				changed].

	^ BTPromise all: {loadGlyph. loadThread}