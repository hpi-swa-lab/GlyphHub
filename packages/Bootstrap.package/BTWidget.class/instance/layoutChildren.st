layout
layoutChildren
	^self submorphs select: [ :child | child ignoreLayout not and: [child visible and: [child isWidget]]]