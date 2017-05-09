converting
jsonString

	^ String streamContents: [:stream |
		self jsonWriteOn: stream]