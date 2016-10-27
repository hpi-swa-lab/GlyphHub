as yet unclassified
groupsContaining: aGlyphName select: aBlock
	^groups
		ifNil: [{}]
		ifNotNil: [
			(groups associationsSelect: [ :group |
				(group value includes: aGlyphName) and: [aBlock value: group key] ]) keys ]