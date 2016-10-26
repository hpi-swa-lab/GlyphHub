reading
testReadArrayInArray
	| expectedResult realResult |
	
	expectedResult := KRNPList new 
		content: (OrderedCollection new
			add: (OrderedCollection new
				add: 694;
				yourself);
			yourself);
		yourself.

	realResult := KRNPListConverter deserialize: ('BP2016H1/testFiles/KerningTool/PlistReaderTestFiles/arrayInArray.plist').
	self assert: expectedResult equals: realResult