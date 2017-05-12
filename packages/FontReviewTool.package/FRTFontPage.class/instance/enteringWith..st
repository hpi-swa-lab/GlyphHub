lifecycle
enteringWith: aFont

	^ (FRTFont load: aFont id populate: #('author' 'family' 'family.standardSampleText') from: self backend)
		then: [:newFont |
			self setFont: newFont.
			
			self family previewGlyphs ifEmpty: [self displayPreviewGlyphsNotice].
			BTPromise all: self tabsContent]