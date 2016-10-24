as yet unclassified
testSimpleDict1
	| expectedResult realResult |
	
	expectedResult := KRNPList new content:
		(OrderedDictionary new add: #ascender -> 694; yourself); yourself.

	realResult := KRNPListConverter deserialize: ('jacet/testFiles/KerningTool/PlistReaderTestFiles/simpleDict1.plist').
	self assert: expectedResult equals: realResult