*KerningTool
colorToAlpha: aColor
	| result |
	result := Form extent: self extent depth: self depth.
	
	0 to: self height - 1 do: [ :y |
		0 to: self width - 1 do: [ :x |
			result
				colorAt: x @ y
				put: (self pixelColor: (self colorAt: x @ y) toAlpha: aColor) ]].
	
	^result