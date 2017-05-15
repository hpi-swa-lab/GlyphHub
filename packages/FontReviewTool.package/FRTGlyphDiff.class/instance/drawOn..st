as yet unclassified
drawOn: aCanvas

	renderer
		drawGlif: old scaleFactor: 0.05 on: aCanvas at: self position color: Color black;
		drawGlif: new scaleFactor: 0.05 on: aCanvas at: self position color: (Color red alpha: 0.5)