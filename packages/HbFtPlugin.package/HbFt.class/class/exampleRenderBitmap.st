as yet unclassified
exampleRenderBitmap
	| form |
	form := Form fromDisplay: (0@0 extent: 200@200).
	self primRenderBitmap: form string: 'Das ist ein Test!' fontSize: 16 dpi: 96 * 2 fontName: '/usr/share/fonts/truetype/roboto/hinted/Roboto-Bold.ttf'.
	form displayOn: Display at: 50 @ 50.