as yet unclassified
testReadArrayDictCombination1
	| expectedResult realResult |
	
	expectedResult := KRNPList new content:
		(OrderedCollection new
			add: (OrderedDictionary new
				add: #outerDict -> (OrderedCollection new
					add: (OrderedDictionary new add: #ascender -> 694; yourself);
					yourself);
				yourself);
			yourself);
		yourself.

	realResult := KRNPListConverter deserialize: ('BP2016H1/testFiles/KerningTool/PlistReaderTestFiles/arrayDictCombination.plist').
	self assert: expectedResult equals: realResult