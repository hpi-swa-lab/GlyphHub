as yet unclassified
manyAssociationTo: aForeignClassName backPopulatesVia: aKey

	^ self new
		foreignClass: aForeignClassName;
		backPopulateKey: aKey;
		cardinality: #many