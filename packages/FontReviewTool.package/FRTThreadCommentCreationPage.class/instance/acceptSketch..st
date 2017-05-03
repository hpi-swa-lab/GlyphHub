callbacks
acceptSketch: aForm

	| index |
	(self valueOfProperty: #sketchDialog) delete.
	self removeProperty: #sketchDialog.
	
	attachmentPreview
		ifNotNil: [attachmentPreview form: aForm]
		ifNil: [
			attachmentPreview := (BTImage form: aForm)
				scalingMode: #shrink;
				align: #(center center).
			index := self submorphIndexOf: preview.
			self remove: preview.
			self add: (BTClickable new
				when: #clicked send: #openSketchEditor to: self;
				add: attachmentPreview) at: index].
	
	self attachment: aForm