converting
fromJsonString: aString

	self fromJson: (Json readFrom: aString readStream)