initialization
postInitialize
	components := OrderedCollection new.
	(glif firstTagNamed: #outline) tagsNamed: #component do: [ :component | | key |
		key := component attributeAt: #base.
		components add: ((KRNVectorData newForXML: (self font glyphAt: key) from: self font)
			transform: (self transformFromNode: component);
			yourself) ].
		components  do: [ :component | component postInitialize ]