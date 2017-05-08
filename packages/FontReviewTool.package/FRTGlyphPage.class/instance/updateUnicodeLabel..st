updating
updateUnicodeLabel: aGlyph.
	
	aGlyph loadGlif
		then: [:glif | | xml codepointText |
			xml := XMLDOMParser parseDocumentFrom: glif readStream.
			
			codepointText := ((xml firstTagNamed: #glyph) elements
				select: [:element | element localName == #unicode]
				thenCollect: [:element | 'U+', (element attributeAt: #hex)]) joinSeparatedBy: ', '.
			unicodeLabel text: '<b>Unicode Codepoints:</b> ', codepointText.
			self topLevel updateBreadcrumbs]