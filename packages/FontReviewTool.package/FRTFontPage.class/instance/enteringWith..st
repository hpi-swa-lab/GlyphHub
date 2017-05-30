lifecycle
enteringWith: aFont

	^ (FRTFont load: aFont id populate: self fontFields from: self backend)
		then: [:newFont |
			self updateFont: newFont.
			
			self font author id = self topLevel user id
				ifTrue: [
					updateButton visible: true.
					self family previewGlyphs ifEmpty: [self displayPreviewGlyphsNotice]].
			
			BTPromise all: self loadTabsContent]