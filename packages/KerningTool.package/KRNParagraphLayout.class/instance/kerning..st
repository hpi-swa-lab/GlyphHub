as yet unclassified
kerning: aBoolean
	kerning := aBoolean.
	owner ifNotNil: [ owner layoutChanged ]