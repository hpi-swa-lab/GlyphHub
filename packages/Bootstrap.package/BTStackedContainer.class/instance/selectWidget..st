hierarchy
selectWidget: aWidget

	self currentWidget ifNotNil: [:widget | widget visible: false].
	self currentWidget: aWidget.
	aWidget visible: true.
	self layoutChanged