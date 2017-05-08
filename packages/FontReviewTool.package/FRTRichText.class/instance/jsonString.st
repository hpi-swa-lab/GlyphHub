as yet unclassified
jsonString

	^ String streamContents: [:stream |
		self jsonWriteOn: stream]