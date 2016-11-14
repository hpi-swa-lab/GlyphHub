*KerningTool
colorToArray: aColor
	^{aColor red * 255.0.
		aColor green * 255.0.
		aColor blue * 255.0.
		aColor alpha * 255.0 }