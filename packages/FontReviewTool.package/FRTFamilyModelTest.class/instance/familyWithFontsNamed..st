as yet unclassified
familyWithFontsNamed: aCollectionOfNameStrings

	^ FRTFamily new fonts: (aCollectionOfNameStrings collect: [:name | FRTFont new fontName: name])