as yet unclassified
exportPList: aPList to: aName
	
	FileDirectory default forceNewFileNamed: aName do:
		[:stream | KRNPListConverter serialize: aPList on: stream]
	