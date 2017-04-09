instance creation
emoticon: anEmoticonString size: aNumber

	| offset |
	offset := (self offsetFor: anEmoticonString)
		ifNil: [self error: anEmoticonString, ' does not exist.'].
	^ BTImageSet new
		form: self emoticonForm
		sourceRectangle: (offset extent: 64 asPoint)
		targetSize: aNumber;
		yourself