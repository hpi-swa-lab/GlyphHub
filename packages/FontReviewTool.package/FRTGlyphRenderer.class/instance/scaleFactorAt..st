helper-drawing
scaleFactorAt: aPointSizeNumber
	" scale factor to scale the font units by to display the glyph at the given point size.
	  also takes care of HiDPI scaling "
	
	^ aPointSizeNumber / (fontinfo at: 'unitsPerEm') * BTWidget scalingFactor