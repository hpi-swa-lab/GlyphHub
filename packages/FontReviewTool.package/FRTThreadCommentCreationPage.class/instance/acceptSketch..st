callbacks
acceptSketch: aForm

	self closeSketchEditor.

	attachmentPreview
		ifNotNil: [attachmentPreview form: aForm]
		ifNil: [ | index |
			attachmentPreview := (BTImage form: aForm)
				scalingMode: #shrink;
				align: #(center center).
			"index := self submorphIndexOf: preview.
			self remove: preview.
			self add: (BTClickable new
				when: #clicked send: #openSketchEditor to: self;
				add: attachmentPreview) at: index]."
			previewArea removeAllMorphs.
			previewArea add: (BTClickable new
				when: #clicked send: #openSketchEditor to: self;
				add: attachmentPreview)].
	
	self attachment: aForm