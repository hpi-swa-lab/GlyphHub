as yet unclassified
delete: aNumber from: aString
	^Promise unit: ((tables at: aString) removeAllSuchThat: [ :entity | (entity at: 'id') = aNumber ])