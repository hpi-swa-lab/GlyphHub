ui
poinSizeChanged: aNumber
self halt.

	self sampleTextWidget ifNotNil: [
		self sampleTextWidget pointSize: aNumber.
		self sampleTextWidget layoutChanged]
	