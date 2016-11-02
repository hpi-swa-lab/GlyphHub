*KerningTool-writing
pListWriteOn: anXMLWriter
	anXMLWriter stream nextPutAll: '<dict>'.
	self keysAndValuesDo: [ :pListKey :pListValue |
		anXMLWriter stream nextPutAll: '<key>',(pListKey asString),'</key>'.
		pListValue pListWriteOn: anXMLWriter].
	anXMLWriter stream nextPutAll: '</dict>'