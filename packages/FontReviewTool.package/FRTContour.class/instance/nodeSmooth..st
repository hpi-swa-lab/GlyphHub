as yet unclassified
nodeSmooth: aNode

	^ (aNode attributeAt: #smooth ifAbsent: ['no']) = 'yes'