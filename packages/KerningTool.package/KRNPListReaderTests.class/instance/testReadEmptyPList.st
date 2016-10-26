as yet unclassified
testReadEmptyPList
	| expectedResult realResult |
	
	expectedResult := KRNPList new.

	realResult := KRNPListConverter deserialize: ('BP2016H1/testFiles/KerningTool/PlistReaderTestFiles/empty.plist').
	self assert: expectedResult equals: realResult