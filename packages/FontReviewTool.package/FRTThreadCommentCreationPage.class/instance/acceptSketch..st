callbacks
acceptSketch: aForm

	self closeSketchEditor.

	attachmentPreview
		ifNotNil: [attachmentPreview form: aForm]
		ifNil: [
			attachmentPreview := (BTImage form: aForm)
				scalingMode: #shrink;
				align: #(center center).
			previewArea removeAllMorphs.
			previewArea add: (BTClickable new
				when: #clicked send: #openSketchEditor to: self;
				add: attachmentPreview)].
	
	self attachment: aForm