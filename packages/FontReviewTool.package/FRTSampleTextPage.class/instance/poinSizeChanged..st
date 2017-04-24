ui
poinSizeChanged: aNumber

	self sampleTextWidget ifNotNil: [
		self sampleTextWidget pointSize: aNumber.
		self sampleTextWidget layoutChanged]
	