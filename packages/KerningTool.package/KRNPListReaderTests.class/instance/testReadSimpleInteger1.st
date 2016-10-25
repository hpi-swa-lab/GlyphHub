as yet unclassified
testReadSimpleInteger1
	| expectedResult realResult |
	
	expectedResult := KRNPList new 
		content: 694;
		yourself.

	realResult := KRNPListConverter deserialize: ('BP2016H1/testFiles/KerningTool/PlistReaderTestFiles/simpleInteger1.plist').
	self assert: expectedResult equals: realResult