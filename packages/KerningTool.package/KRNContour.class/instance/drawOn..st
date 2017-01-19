initialize-release
drawOn: aCanvas
	" don't want a background "
	self submorphs do: [:s | s drawOn: aCanvas ]