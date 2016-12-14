accessing
notifyEditor: state
	self editor ifNotNilDo: [ :editor | editor selectedPoint: self state: state ]