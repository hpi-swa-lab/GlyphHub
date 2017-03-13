as yet unclassified
initTestData
	tables
		at: 'penguin' put: (BTModelList with: ({'name' -> 'Charles'. 'id' -> 1. 'age' -> 37} as: Dictionary));
		at: 'beak' put: BTModelList new;
		at: 'egg' put: BTModelList new;
		at: 'pub' put: BTModelList new