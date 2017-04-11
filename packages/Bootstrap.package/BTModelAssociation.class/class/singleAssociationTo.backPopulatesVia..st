as yet unclassified
singleAssociationTo: aForeignClassName backPopulatesVia: aKey

	^ self new
		foreignClass: aForeignClassName;
		backPopulateKey: aKey;
		cardinality: #single