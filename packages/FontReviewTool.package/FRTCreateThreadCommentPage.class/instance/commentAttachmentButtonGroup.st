initialize-release
commentAttachmentButtonGroup

	^ BTButtonGroup new
		add: ((BTButton icon: #paint_brush)
			when: #clicked send: #openSketchEditor: to: self);
		add: ((BTButton icon: #object_ungroup)
			when: #clicked send: #openCurveEditor: to: self);
		add: ((BTButton icon: #camera)
			when: #clicked send: #openFilePicker: to: self)