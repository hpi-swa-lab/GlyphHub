initialize-release
editingButtonGroup

	| toolBarButtonGroup |
	colorButton := BTButton icon: #circle.
	self penColor: (Color fromString: FRTColorPicker defaultColors first).
	FRTColorPicker new
		attachTo: colorButton;
		when: #colorSelected send: #penColor: to: self.

	toolBarButtonGroup := BTButtonGroup new.

	self toolBarButtons do: [:button | toolBarButtonGroup add: button].
	
	^ toolBarButtonGroup