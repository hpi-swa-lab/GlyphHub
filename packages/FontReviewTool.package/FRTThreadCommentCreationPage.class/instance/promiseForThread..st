callbacks
promiseForThread: aThread

	^ aThread isCreated
		ifFalse: [BTPromise unit: aThread]
		ifTrue: [
			(FRTThread
				load: aThread id
				populate: #(comments  'comments.author' threadGlyphAssociations 'threadGlyphAssociations.glyph' 'threadGlyphAssociations.glyph.font' 'threadGlyphAssociations.glyph.font.family')
				from: self backend)].
