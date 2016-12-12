accessing
notifyEditor
	self editor ifNotNilDo: [ :editor | editor selectedPoint: self ]