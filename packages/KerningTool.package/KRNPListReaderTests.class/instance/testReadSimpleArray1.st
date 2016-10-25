as yet unclassified
testReadSimpleArray1
	| expectedResult realResult |
	
	expectedResult := KRNPList new content:
		(OrderedCollection new
			add: 694;
			add: 'public.default'; 
			yourself).

	realResult := KRNPListConverter deserialize: ('BP2016H1/testFiles/KerningTool/PlistReaderTestFiles/simpleArray1.plist').
	self assert: expectedResult equals: realResult