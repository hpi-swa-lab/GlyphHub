event handling
addKerning: aNumber
	| firstName secondName list |
	" submorphs are added in reverse order "
	firstName := cursor submorphAfter name.
	secondName := cursor submorphBefore name.
	
	list := (self font kerning at: firstName ifAbsentPut: [OrderedDictionary new]).
	list at: secondName put: ((list at: secondName ifAbsent: [0]) + aNumber).
	
	targetView layoutChanged.
	detailView layoutChanged