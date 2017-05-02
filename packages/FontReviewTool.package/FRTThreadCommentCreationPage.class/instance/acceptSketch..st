callbacks
acceptSketch: aForm

	(self valueOfProperty: #sketchDialog) delete.
	self removeProperty: #sketchDialog.
	
	self attachment: aForm