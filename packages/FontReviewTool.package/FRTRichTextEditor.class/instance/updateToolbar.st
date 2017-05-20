initialize-release
updateToolbar

	| newToolbar |
	newToolbar := self createToolbar.
	self replaceSubmorph: toolbar by: newToolbar.
	toolbar := newToolbar.