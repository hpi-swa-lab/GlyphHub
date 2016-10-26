reading
testReadDictInDict
	| expectedResult realResult |
	
	expectedResult := KRNPList new 
		content: (OrderedDictionary new
			add: #outerDict -> (OrderedDictionary new
				add: #ascender -> 694;
				yourself);
			yourself);
		yourself.

	realResult := KRNPListConverter deserialize: ('BP2016H1/testFiles/KerningTool/PlistReaderTestFiles/dictInDict.plist').
	self assert: expectedResult equals: realResult