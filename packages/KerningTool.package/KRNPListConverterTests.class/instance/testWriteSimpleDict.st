writing
testWriteSimpleDict
	| expectedResult testInput |
	 
	expectedResult := '<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
	<dict>
		<key>ascender</key>
		<integer>694</integer>
	</dict>
</plist>'.
	
	testInput := KRNPList new 
		content: (OrderedDictionary new
			add: 'ascender' -> 694;
			yourself);
		yourself.
	
	self
		assert: (self helperTestParsePListToXMLString: testInput)
		equals: (self helperTestParseStringToXMLString: expectedResult)