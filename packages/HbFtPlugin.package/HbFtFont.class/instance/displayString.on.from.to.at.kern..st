displaying
displayString: aString on: aDisplayContext from: startIndex to: stopIndex at: aPoint kern: kernDelta
	"Draw the given string from startIndex to stopIndex 
	at aPoint on the (already prepared) display context."
	HbFt primRenderBitmap: aDisplayContext sourceForm string: aString fontSize: self pointSize dpi: 96 * 2 fontName: self familyName.

	aDisplayContext
		destX: aDisplayContext clipRect origin x;
		destY: aDisplayContext clipRect origin y;
		sourceX: 0;
		sourceY: 0;
		width: aDisplayContext sourceForm boundingBox width;
		height: aDisplayContext sourceForm boundingBox height;
		copyBits.
	"aDisplayContext image: form at: aDisplayContext clipRect origin sourceRect: form boundingBox rule: 34"