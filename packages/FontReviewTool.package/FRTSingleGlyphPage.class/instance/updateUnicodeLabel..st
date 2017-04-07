accessing
updateUnicodeLabel: aGlyph.
	
	aGlyph loadGlif
		then: [:glif | | xml |
			xml := XMLDOMParser parseDocumentFrom: glif readStream.
			
			unicodeLabel text: '<b>Unicode Codepoints:</b> ', (((xml firstTagNamed: #glyph) elements
				select: [:element | element localName == #unicode]
				thenCollect: [:element | '0x', (element attributeAt: #hex)]) joinSeparatedBy: ', ').
			self topLevel updateBreadcrumbs]