writing
testWriteArrayDictCombination
	| expectedResult testInput |
	 
	expectedResult := '<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
	<array>
		<dict>
			<key>outerDict</key>
			<array>
				<dict>
					<key>ascender</key>
					<integer>694</integer>
				</dict>
			</array>
		</dict>
	</array>
</plist>'.
	
	testInput := KRNPList new content:
		(OrderedCollection new
			add: (OrderedDictionary new
				add: #outerDict -> (OrderedCollection new
					add: (OrderedDictionary new add: #ascender -> 694; yourself);
					yourself);
				yourself);
			yourself);
		yourself.
	
	self
		assert: (self helperTestParsePListToXMLString: testInput)
		equals: (self helperTestParseStringToXMLString: expectedResult)