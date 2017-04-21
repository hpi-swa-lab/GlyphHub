hierarchy
selectWidget: aWidget

	self currentWidget ifNotNil: [:widget | self remove: widget].
	self currentWidget: aWidget.
	self add: aWidget.
