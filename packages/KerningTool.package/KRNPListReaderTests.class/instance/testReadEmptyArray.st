as yet unclassified
testReadEmptyArray
	| expectedResult realResult |
	
	expectedResult := KRNPList new 
		content: (OrderedCollection new);
		yourself.

	realResult := KRNPListConverter deserialize: ('BP2016H1/testFiles/KerningTool/PlistReaderTestFiles/emptyArray.plist').
	self assert: expectedResult equals: realResult