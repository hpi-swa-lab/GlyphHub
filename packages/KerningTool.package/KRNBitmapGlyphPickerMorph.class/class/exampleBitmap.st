as yet unclassified
exampleBitmap
	^ExampleBitmap
		ifNil: [ ExampleBitmap := (Form fromFileNamed: '/home/tom/glyphs.png') colorToAlpha: Color white ]