initialize-release
commentAttachmentButtonGroup

	^ BTButtonGroup new
		add: ((BTButton icon: #paint_brush)
			when: #clickedWithEvent send: #openSketchEditor: to: self);
		add: ((BTButton icon: #object_ungroup)
			when: #clickedWithEvent send: #openCurveEditor: to: self);
		add: ((BTButton icon: #camera)
			when: #clickedWithEvent send: #openFilePicker: to: self)