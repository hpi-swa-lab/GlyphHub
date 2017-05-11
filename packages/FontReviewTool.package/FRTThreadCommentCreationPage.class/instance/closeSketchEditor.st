actions
closeSketchEditor

	| dialog |
	dialog := self valueOfProperty: #sketchDialog ifAbsent: [^ self].
	dialog delete.
	self removeProperty: #sketchDialog.
	