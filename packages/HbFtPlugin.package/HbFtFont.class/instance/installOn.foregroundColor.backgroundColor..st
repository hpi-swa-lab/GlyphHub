displaying
installOn: aDisplayContext foregroundColor: foregroundColor backgroundColor: backgroundColor
	"Install the receiver on the given DisplayContext (either BitBlt or Canvas) for further drawing operations."
	| canvas |
	canvas := Display defaultCanvasClass extent: aDisplayContext clipRect extent.
	canvas fillColor: backgroundColor.
	aDisplayContext sourceForm: canvas form
	"form := canvas form"