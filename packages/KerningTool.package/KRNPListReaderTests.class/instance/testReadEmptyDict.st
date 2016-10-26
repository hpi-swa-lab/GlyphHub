as yet unclassified
testReadEmptyDict
	| expectedResult realResult |
	
	expectedResult := KRNPList new 
		content: (OrderedDictionary new);
		yourself.

	realResult := KRNPListConverter deserialize: ('BP2016H1/testFiles/KerningTool/PlistReaderTestFiles/emptyDict.plist').
	self assert: expectedResult equals: realResult