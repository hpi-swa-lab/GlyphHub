as yet unclassified
loadBy: aSelector value: aValue from: aString class: aClass
	| entity |
	entity := (tables at: aString) detect: [ :e | (e at: aSelector asString) = aValue ].
	^Promise unit: (self deserialize: entity class: aClass)