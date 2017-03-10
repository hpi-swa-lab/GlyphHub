as yet unclassified
loadAllFrom: aString class: aClass
	^Promise unit: ((tables at: aString) collect: [ :entity | self deserialize: entity class: aClass ])