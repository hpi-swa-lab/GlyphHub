as yet unclassified
getString: stringPtr
	<var: #stringPtr type: 'char *'>
	<var: #oopPtr type: 'char *'>
	| stringLen stringOop oopPtr |
	stringLen := self strlen: stringPtr.
	stringOop := interpreterProxy instantiateClass: (interpreterProxy classString) indexableSize: stringLen.
	oopPtr := interpreterProxy firstIndexableField: stringOop.
	0 to: stringLen - 1 do: [ :j | oopPtr at: j put: (stringPtr at: j) ].
	^stringOop