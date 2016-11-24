as yet unclassified
assert: aCollection equalsContent: anotherCollection
	self assert: (aCollection hasEqualElements: anotherCollection) description: 'Expected ', aCollection, ' to contain the same as ', anotherCollection