as yet unclassified
exportPList: aPList to: aName
	
	FileDirectory default fileNamed: aName do:
		[:stream | KRNPListConverter serialize: aPList on: stream]
	